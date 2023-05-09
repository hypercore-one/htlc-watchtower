import 'dart:io';

import 'package:isar/isar.dart';

import '../models/database/htlc_data.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

class DatabaseService {
  static Isar? isar;

  static final _databasePath = '${Directory.current.path}/database';

  static DatabaseService? _instance;

  static DatabaseService getInstance() {
    _instance ??= DatabaseService();
    if (isar == null || !isar!.isOpen) {
      Directory(_databasePath).createSync();
      isar = Isar.openSync(
        [HtlcDataSchema],
        name: databaseFileName,
        directory: _databasePath,
        maxSizeMiB: isarMaxSizeMiB,
      );
    }
    return _instance!;
  }

  Future<void> storeHtlcDatas(List<HtlcData> datas) async {
    await isar!.writeTxn(() async {
      await isar!.htlcDatas.putAll(datas);
    });
  }

  Future<String?> getHashlockForHtlcId(String htlcId) async {
    return (await isar!.htlcDatas.filter().idEqualTo(htlcId).findFirst())
        ?.hashlock;
  }

  Future<List<HtlcData>> getHtlcDatasForHashlock(String hashlock) async {
    return await isar!.htlcDatas.filter().hashlockEqualTo(hashlock).findAll();
  }

  Future<List<HtlcData>> getHtlcDatasWithPreimage() async {
    return await isar!.htlcDatas.filter().preimageIsNotNull().findAll();
  }

  Future<void> deleteHtlcData(String htlcId) async {
    await isar!.writeTxn(() async {
      await isar!.htlcDatas.delete(Utils.htlcIdToDatabaseId(htlcId));
    });
  }

  Future<void> deleteExpiredHtlcDatas() async {
    await isar!.writeTxn(() async {
      await isar!.htlcDatas
          .filter()
          .expirationTimeLessThan(Utils.unixTimeNow)
          .deleteAll();
    });
  }
}
