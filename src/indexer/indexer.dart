import 'dart:convert';
import 'dart:io';

import 'package:hex/hex.dart';
import 'package:logging/logging.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../models/database/htlc_data.dart';
import '../models/decoded_block_data.dart';
import '../services/database_service.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

class Indexer {
  static Indexer? _instance;
  static DatabaseService? _dbService;
  final _cacheDirectory = '${Directory.current.path}/cache';
  final _cacheFile = '$cacheFileName.json';
  final _log = Logger('Indexer');

  static Indexer getInstance() {
    _instance ??= Indexer();
    if (_dbService == null) {
      _dbService = DatabaseService.getInstance();
    }
    return _instance!;
  }

  Future<void> syncHtlcBlocks(Zenon zenon) async {
    try {
      while (true) {
        final cachedHeight = _getLastCheckedHeight();
        final frontier =
            await zenon.ledger.getFrontierAccountBlock(htlcAddress);

        if (frontier == null || cachedHeight >= frontier.height) {
          break;
        }

        final blocks = (await zenon.ledger
                .getAccountBlocksByHeight(htlcAddress, cachedHeight + 1, 100))
            .list;

        if (blocks == null) {
          break;
        }

        // Remove unconfirmed blocks
        blocks.removeWhere((e) => e.confirmationDetail == null);
        if (blocks.isNotEmpty) {
          await _processBlocks(blocks);
          _cacheLastCheckedHeight(blocks.last.height);
        }
      }
    } catch (e) {
      _log.severe(e);
    }
  }

  Future<void> deleteExpiredHtlcDatas() async {
    await _dbService!.deleteExpiredHtlcDatas();
  }

  Future<void> _processBlocks(List<AccountBlock> blocks) async {
    final List<HtlcData> createdHtlcs = [];
    final List<DecodedBlockData> unlockedHtlcs = [];

    for (final block in blocks) {
      if (block.blockType != BlockTypeEnum.contractReceive.index) {
        continue;
      }
      final pairedBlock = block.pairedAccountBlock;
      if (pairedBlock == null) {
        _log.severe('Paired block is null for block ${block.hash.toString()}');
        continue;
      }
      final data =
          Utils.getDecodedBlockData(Definitions.htlc, pairedBlock.data);
      if (data == null) {
        continue;
      }
      switch (data.function) {
        case 'Create':
          if (!(await _shouldMonitorHtlc(pairedBlock.address.toString(), data,
              createdHtlcs, block.height))) {
            break;
          }
          createdHtlcs.add(HtlcData(
              id: pairedBlock.hash.toString(),
              hashlock: Hash.fromBytes(data.params['hashLock']).toString(),
              sender: pairedBlock.address.toString(),
              recipient: data.params['hashLocked'].toString(),
              creationTime: block.confirmationDetail!.momentumTimestamp,
              expirationTime: data.params['expirationTime'].toInt(),
              amountString: pairedBlock.amount.toString(),
              tokenStandard: pairedBlock.tokenStandard.toString()));
          break;
        case 'Unlock':
          if (block.descendantBlocks.isNotEmpty) {
            unlockedHtlcs.add(data);
          }
          break;
      }
    }
    await _dbService!.storeHtlcDatas(createdHtlcs);
    for (final data in unlockedHtlcs) {
      await _addPreimageToHtlcDatas(
          data.params['id'].toString(), HEX.encode(data.params['preimage']));
      await _dbService!.deleteHtlcData(data.params['id'].toString());
      createdHtlcs.removeWhere((e) => e.id == data.params['id'].toString());
    }
    if (createdHtlcs.length > 0) {
      _log.info('Watching over ${createdHtlcs.length} new HTLC(s)');
    }
  }

  Future<void> _addPreimageToHtlcDatas(String id, String preimage) async {
    final hashlock = await _dbService!.getHashlockForHtlcId(id);
    if (hashlock != null) {
      final htlcDatas = await _dbService!.getHtlcDatasByHashlock(hashlock);
      for (var i = 0; i < htlcDatas.length; i += 1) {
        htlcDatas[i].preimage = preimage;
      }
      await _dbService!.storeHtlcDatas(htlcDatas);
    }
  }

  void _cacheLastCheckedHeight(int height) {
    final cacheDir = Directory(_cacheDirectory);
    if (!cacheDir.existsSync()) {
      cacheDir.createSync();
    }
    File('$_cacheDirectory/$_cacheFile').writeAsStringSync(
        JsonEncoder.withIndent('  ').convert({'last_checked_height': height}));
  }

  int _getLastCheckedHeight() {
    final cache = File('$_cacheDirectory/$_cacheFile');
    return cache.existsSync()
        ? json.decode(cache.readAsStringSync())['last_checked_height']
        : 0;
  }

  Future<bool> _shouldMonitorHtlc(String sender, DecodedBlockData data,
      List<HtlcData> newHtlcs, int blockHeight) async {
    final expirationTime = data.params['expirationTime'].toInt();
    final recipient = data.params['hashLocked'].toString();
    final hashlock = Hash.fromBytes(data.params['hashLock']).toString();

    // Don't monitor expired HTLCs.
    if (expirationTime <= Utils.unixTimeNow) {
      return false;
    }

    // Don't monitor HTLCs that expire after $maxHtlcExpirationInHours.
    // Wallets should disallow P2P swaps with HTLCs that exceed
    // $maxHtlcExpirationInHours.
    if (expirationTime - Utils.unixTimeNow >
        maxHtlcExpirationInHours * 60 * 60) {
      _log.info('''Encountered HTLC with expiration time ($expirationTime) 
          exceeding the max allowed expiration time. 
          The HTLC will not be monitored. Block height: $blockHeight''');
      return false;
    }

    // Don't monitor the HTLC if an HTLC that is not a counter HTLC is created
    // with an existing hashlock. This should not happen with P2P swaps and
    // wallets should check that the initial HTLC's hashlock has not been used
    // in the past $maxHtlcExpirationInHours to ensure the watchtower is
    // monitoring the HTLC.
    final htlcsWithSameHashlock =
        await _dbService!.getHtlcDatasByHashlock(hashlock);
    htlcsWithSameHashlock.addAll(newHtlcs.where((e) => e.hashlock == hashlock));

    if (htlcsWithSameHashlock.isEmpty) {
      return true;
    }

    // Check for a counter HTLC
    if (htlcsWithSameHashlock
            .where((e) => e.sender == recipient && e.recipient == sender)
            .length ==
        1) {
      return true;
    }

    _log.info('''Encountered HTLC with non-unique hashlock ($hashlock). 
          The HTLC will not be monitored. Block height: $blockHeight''');
    return false;
  }
}
