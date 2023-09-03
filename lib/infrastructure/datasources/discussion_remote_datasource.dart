import 'package:aewallet/domain/models/core/failures.dart';
import 'package:aewallet/model/data/messenger/discussion.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';

class DiscussionRemoteDatasource with MessengerMixin {
  Future<Discussion> createDiscussion({
    required MessagingService messagingService,
    required ApiService apiService,
    required List<String> membersPubKey,
    required String discussionName,
    required List<String> adminsPubKeys,
    required String adminAddress,
    required String serviceName,
    required Keychain keychain,
  }) async {
    final transaction = await messagingService.createDiscussion(
      keychain: keychain,
      apiService: apiService,
      membersPubKey: membersPubKey.map((e) => e).whereType<String>().toList(),
      discussionName: discussionName,
      adminsPubKey: adminsPubKeys.map((e) => e).whereType<String>().toList(),
      adminAddress: adminAddress,
      serviceName: serviceName,
    );

    return Discussion(
      creationDate: DateTime.now(),
      address: transaction.address!.address!,
      name: discussionName,
      membersPubKeys: membersPubKey,
      adminsPubKeys: adminsPubKeys,
    );
  }

  Future<double> calculateMessageSendFees({
    required MessagingService messagingService,
    required Keychain keychain,
    required ApiService apiService,
    required String scAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    final result = await messagingService.buildMessage(
      keychain: keychain,
      apiService: apiService,
      discussionSCAddress: scAddress,
      messageContent: messageContent,
      senderAddress: senderAddress,
      senderServiceName: senderServiceName,
      senderKeyPair: senderKeyPair,
    );

    final fee = await apiService.getTransactionFee(result.transaction);
    if (fee.fee == null) throw const Failure.invalidValue();
    return fromBigInt(fee.fee).toDouble();
  }
}
