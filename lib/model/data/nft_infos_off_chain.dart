/// SPDX-License-Identifier: AGPL-3.0-or-later

// Package imports:
import 'package:aewallet/infrastructure/datasources/appdb.hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'nft_infos_off_chain.freezed.dart';
part 'nft_infos_off_chain.g.dart';

@freezed
class NftInfosOffChain with _$NftInfosOffChain {
  @HiveType(typeId: HiveTypeIds.nftInfosOffChain)
  @Deprecated('Thanks to hive, we should keep this unused class...')
  factory NftInfosOffChain({
    /// Token's Id
    @HiveField(0) String? id,

    /// Category Nft
    @HiveField(3) int? categoryNftIndex,

    /// Favorite
    @HiveField(4) bool? favorite,
  }) = _NftInfosOffChain;

  factory NftInfosOffChain.fromJson(Map<String, dynamic> json) =>
      _$NftInfosOffChainFromJson(json);
}
