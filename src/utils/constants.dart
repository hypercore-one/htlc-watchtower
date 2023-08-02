import 'package:isar/isar.dart';

const int isarMaxSizeMiB = Isar.defaultMaxSizeMiB * 10;
const int minimumFusedQsrForWallet = 120;
const String cacheFileName = 'cache';
const String databaseFileName = 'htlc_data';
const String configurationFileName = 'config';
const String keyStoreName = 'htlc_watchtower';
const String keyStorePassword = 'watchtower';
const int maxHtlcExpirationInHours = 24;
