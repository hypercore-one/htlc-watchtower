import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import '../models/decoded_block_data.dart';

class Utils {
  static final _log = Logger('Utils');

  static int get unixTimeNow =>
      (DateTime.now().millisecondsSinceEpoch / 1000).round();

  static DecodedBlockData? getDecodedBlockData(Abi abi, List<int> encodedData) {
    if (encodedData.length < AbiFunction.encodedSignLength) {
      return null;
    }
    final eq = const ListEquality().equals;
    try {
      for (final entry in abi.entries) {
        if (eq(AbiFunction.extractSignature(entry.encodeSignature()),
            AbiFunction.extractSignature(encodedData))) {
          final decoded =
              AbiFunction(entry.name!, entry.inputs!).decode(encodedData);
          final Map<String, dynamic> params = {};
          for (int i = 0; i < entry.inputs!.length; i += 1) {
            params[entry.inputs![i].name!] = decoded[i];
          }
          return DecodedBlockData(function: entry.name!, params: params);
        }
      }
    } catch (e) {
      _log.severe(e);
    }
    return null;
  }

  static Future<bool> isNodeSynced(Zenon zenon) async {
    final syncInfo = await zenon.stats.syncInfo();
    return (syncInfo.state == SyncState.syncDone ||
        (syncInfo.targetHeight > 0 &&
            syncInfo.currentHeight > 0 &&
            (syncInfo.targetHeight - syncInfo.currentHeight) < 20));
  }

  static Future<int> getMomentumsUntilSynced(Zenon zenon) async {
    final syncInfo = await zenon.stats.syncInfo();
    return syncInfo.targetHeight - syncInfo.currentHeight;
  }

  static int htlcIdToDatabaseId(String htlcId) => _fastHash(htlcId);

  // Reference: https://isar.dev/recipes/string_ids.html#fast-hash-function
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int _fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
