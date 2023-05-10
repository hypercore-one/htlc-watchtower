import 'package:hex/hex.dart';
import 'package:logging/logging.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../models/database/htlc_data.dart';
import '../services/database_service.dart';
import '../utils/utils.dart';
import '../utils/wallet_utils.dart';

class ProxyUnlockHandler {
  static ProxyUnlockHandler? _instance;
  static DatabaseService? _dbService;

  final _log = Logger('ProxyUnlockHandler');

  static ProxyUnlockHandler getInstance() {
    _instance ??= ProxyUnlockHandler();
    if (_dbService == null) {
      _dbService = DatabaseService.getInstance();
    }
    return _instance!;
  }

  Future<void> run(Zenon zenon) async {
    try {
      final htlcDatasToUnlock = await _dbService!.getHtlcDatasToUnlock();
      for (final data in htlcDatasToUnlock) {
        if (await _canProxyUnlock(zenon, data.recipient, data.id)) {
          await _unlockHtlc(zenon, data).then((_) async {
            _log.info('Unlocked HTLC with ID ${data.id}');
            await _dbService!.deleteHtlcData(data.id);
            // Give the node time to process the transaction.
            await Future.delayed(const Duration(seconds: 1));
          });
        }
      }
    } catch (e) {
      _log.severe(e);
    }
  }

  Future<void> _unlockHtlc(Zenon zenon, HtlcData htlcData) async {
    try {
      final params = zenon.embedded.htlc
          .unlock(Hash.parse(htlcData.id), HEX.decode(htlcData.preimage!));
      await zenon.send(
        params,
        waitForRequiredPlasma: true,
      );
    } catch (e) {
      _log.severe(e);
    }
  }

  Future<bool> _canProxyUnlock(
      Zenon zenon, String address, String htlcId) async {
    if (!(await Utils.isNodeSynced(zenon))) {
      return false;
    }

    if (!(await WalletUtils.hasEnoughPlasma(zenon))) {
      return false;
    }

    try {
      await zenon.embedded.htlc.getById(Hash.parse(htlcId));
    } catch (e) {
      _log.info(e);
      return false;
    }

    if (!(await zenon.embedded.htlc
        .getProxyUnlockStatus(Address.parse(address)))) {
      return false;
    }

    return true;
  }
}
