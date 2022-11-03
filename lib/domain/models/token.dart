/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';
part 'token.freezed.dart';

/// Represents a token, blockchain agnostic.
@freezed
class Token with _$Token {
  const factory Token({
    required String seed,
    required String accountSelectedName,
    required String name,
    required String symbol,
    required double initialSupply,
    required String type,
    required Map<String, dynamic> properties,
  }) = _Token;
  const Token._();
}
