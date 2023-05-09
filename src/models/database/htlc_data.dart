import 'package:isar/isar.dart';

import '../../utils/utils.dart';

part 'htlc_data.g.dart';

@collection
class HtlcData {
  final String id;
  Id get isarId => Utils.htlcIdToDatabaseId(id);
  final String hashlock;
  final String sender;
  final String recipient;
  final int creationTime;
  final int expirationTime;
  String? preimage;

  HtlcData({
    required this.id,
    required this.hashlock,
    required this.sender,
    required this.recipient,
    required this.creationTime,
    required this.expirationTime,
    this.preimage,
  });
}
