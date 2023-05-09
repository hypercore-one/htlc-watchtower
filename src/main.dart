import 'dart:io';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import 'config/config.dart';
import 'indexer/indexer.dart';
import 'handlers/proxy_unlock_handler.dart';
import 'utils/constants.dart';
import 'utils/utils.dart';
import 'utils/wallet_utils.dart';

final _log = Logger('main');

Future<void> main(List<String> arguments) async {
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  await _initialize().then((zenon) => _run(zenon)).catchError((e) {
    _log.severe(e);
    exit(0);
  });
}

Future<Zenon> _initialize() async {
  Config.load();
  await Isar.initializeIsarCore(download: true);

  final zenon = Zenon();
  final isConnected =
      await zenon.wsClient.initialize(Config.nodeUrlWs, retry: false);

  if (!isConnected) {
    throw 'Failed to connect to Zenon node. Is the node running?';
  }
  _log.info('Connected to node ${Config.nodeUrlWs}');

  await _waitForNodeToSync(zenon);

  final frontier = await zenon.ledger.getFrontierMomentum();
  setChainIdentifier(chainIdentifier: frontier.chainIdentifier);

  zenon.defaultKeyPair = await WalletUtils.initializeWallet();

  if (!(await WalletUtils.hasEnoughPlasma(zenon))) {
    _log.info('''The watchtower does not have enough Plasma. '''
        '''Please fuse at least ${minimumFusedQsrForWallet} QSR to address: '''
        '''${(await zenon.defaultKeyPair!.address).toString()}''');
    await _waitForPlasma(zenon);
  }

  _log.info('''Watchtower initialized with address '''
      '''${(await zenon.defaultKeyPair!.address).toString()}''');

  return zenon;
}

Future<void> _waitForNodeToSync(Zenon zenon) async {
  while (!(await Utils.isNodeSynced(zenon))) {
    final remaining = await Utils.getMomentumsUntilSynced(zenon);
    _log.info('Waiting for the node to sync. Remaining momentums: $remaining');
    await Future.delayed(const Duration(seconds: 30));
  }
  _log.info('Node is in sync');
}

Future<void> _waitForPlasma(Zenon zenon) async {
  _log.info('Waiting for Plasma');
  while (!(await WalletUtils.hasEnoughPlasma(zenon))) {
    await Future.delayed(const Duration(seconds: 10));
  }
  _log.info('The watchtower has enough Plasma now');
}

Future<void> _run(Zenon zenon) async {
  _log.info('Running watchtower');
  await Indexer.getInstance().deleteExpiredHtlcDatas();
  await Indexer.getInstance().syncHtlcBlocks(zenon);
  await ProxyUnlockHandler.getInstance().run(zenon);
  Future.delayed(const Duration(minutes: 5), () async {
    _run(zenon);
  });
}
