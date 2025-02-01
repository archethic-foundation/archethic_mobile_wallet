/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:aewallet/infrastructure/datasources/appdb.hive.dart';
import 'package:aewallet/model/blockchain/token_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'account_token.freezed.dart';
part 'account_token.g.dart';

class AccountTokenConverter
    implements JsonConverter<AccountToken, Map<String, dynamic>> {
  const AccountTokenConverter();

  @override
  AccountToken fromJson(Map<String, dynamic> json) {
    return AccountToken(
      tokenInformation: json['tokenInformation'] != null
          ? TokenInformation.fromJson(
              json['tokenInformation'] as Map<String, dynamic>,
            )
          : null,
      amount: json['amount'] as double,
    );
  }

  @override
  Map<String, dynamic> toJson(AccountToken accountToken) {
    return {
      'tokenInformation': accountToken.tokenInformation?.toJson(),
      'amount': accountToken.amount,
    };
  }
}

/// Next field available : 9
@freezed
class AccountToken with _$AccountToken {
  @HiveType(typeId: HiveTypeIds.accountToken)
  factory AccountToken({
    @HiveField(7) TokenInformation? tokenInformation,
    @HiveField(8) double? amount,
  }) = _AccountToken;

  factory AccountToken.fromJson(Map<String, dynamic> json) =>
      _$AccountTokenFromJson(json);
}
