import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import 'constants.dart';

class WalletUtils {
  static Future<KeyPair> initializeWallet() async {
    final manager = KeyStoreManager(walletPath: znnDefaultWalletDirectory);
    var keyStoreFile = await manager.findKeyStore(keyStoreName);

    if (keyStoreFile == null) {
      keyStoreFile = await manager.createNew(keyStorePassword, keyStoreName);
      Logger('WalletUtils').info('Created keystore for watchtower.');
    }

    final keyStore =
        await KeyFile.fromJson(json.decode(keyStoreFile.readAsStringSync()))
            .decrypt(keyStorePassword);

    return keyStore.getKeyPair(0);
  }

  static Future<bool> hasEnoughPlasma(Zenon zenon) async {
    final address = await zenon.defaultKeyPair!.address;
    return (await zenon.embedded.plasma.get(address!)).qsrAmount >=
        AmountUtils.extractDecimals(
            minimumFusedQsrForWallet.toString(), coinDecimals);
  }
}
