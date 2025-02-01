// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_infos_off_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftInfosOffChain _$NftInfosOffChainFromJson(Map<String, dynamic> json) {
  return _NftInfosOffChain.fromJson(json);
}

/// @nodoc
mixin _$NftInfosOffChain {
  /// Token's Id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  /// Category Nft
  @HiveField(3)
  int? get categoryNftIndex => throw _privateConstructorUsedError;

  /// Favorite
  @HiveField(4)
  bool? get favorite => throw _privateConstructorUsedError;

  /// Serializes this NftInfosOffChain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftInfosOffChain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftInfosOffChainCopyWith<NftInfosOffChain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftInfosOffChainCopyWith<$Res> {
  factory $NftInfosOffChainCopyWith(
          NftInfosOffChain value, $Res Function(NftInfosOffChain) then) =
      _$NftInfosOffChainCopyWithImpl<$Res, NftInfosOffChain>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(3) int? categoryNftIndex,
      @HiveField(4) bool? favorite});
}

/// @nodoc
class _$NftInfosOffChainCopyWithImpl<$Res, $Val extends NftInfosOffChain>
    implements $NftInfosOffChainCopyWith<$Res> {
  _$NftInfosOffChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftInfosOffChain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryNftIndex = freezed,
    Object? favorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryNftIndex: freezed == categoryNftIndex
          ? _value.categoryNftIndex
          : categoryNftIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NftInfosOffChainImplCopyWith<$Res>
    implements $NftInfosOffChainCopyWith<$Res> {
  factory _$$NftInfosOffChainImplCopyWith(_$NftInfosOffChainImpl value,
          $Res Function(_$NftInfosOffChainImpl) then) =
      __$$NftInfosOffChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(3) int? categoryNftIndex,
      @HiveField(4) bool? favorite});
}

/// @nodoc
class __$$NftInfosOffChainImplCopyWithImpl<$Res>
    extends _$NftInfosOffChainCopyWithImpl<$Res, _$NftInfosOffChainImpl>
    implements _$$NftInfosOffChainImplCopyWith<$Res> {
  __$$NftInfosOffChainImplCopyWithImpl(_$NftInfosOffChainImpl _value,
      $Res Function(_$NftInfosOffChainImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftInfosOffChain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryNftIndex = freezed,
    Object? favorite = freezed,
  }) {
    return _then(_$NftInfosOffChainImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryNftIndex: freezed == categoryNftIndex
          ? _value.categoryNftIndex
          : categoryNftIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.nftInfosOffChain)
@Deprecated('Thanks to hive, we should keep this unused class...')
class _$NftInfosOffChainImpl implements _NftInfosOffChain {
  _$NftInfosOffChainImpl(
      {@HiveField(0) this.id,
      @HiveField(3) this.categoryNftIndex,
      @HiveField(4) this.favorite});

  factory _$NftInfosOffChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftInfosOffChainImplFromJson(json);

  /// Token's Id
  @override
  @HiveField(0)
  final String? id;

  /// Category Nft
  @override
  @HiveField(3)
  final int? categoryNftIndex;

  /// Favorite
  @override
  @HiveField(4)
  final bool? favorite;

  @override
  String toString() {
    return 'NftInfosOffChain(id: $id, categoryNftIndex: $categoryNftIndex, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftInfosOffChainImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryNftIndex, categoryNftIndex) ||
                other.categoryNftIndex == categoryNftIndex) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryNftIndex, favorite);

  /// Create a copy of NftInfosOffChain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftInfosOffChainImplCopyWith<_$NftInfosOffChainImpl> get copyWith =>
      __$$NftInfosOffChainImplCopyWithImpl<_$NftInfosOffChainImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftInfosOffChainImplToJson(
      this,
    );
  }
}

abstract class _NftInfosOffChain implements NftInfosOffChain {
  factory _NftInfosOffChain(
      {@HiveField(0) final String? id,
      @HiveField(3) final int? categoryNftIndex,
      @HiveField(4) final bool? favorite}) = _$NftInfosOffChainImpl;

  factory _NftInfosOffChain.fromJson(Map<String, dynamic> json) =
      _$NftInfosOffChainImpl.fromJson;

  /// Token's Id
  @override
  @HiveField(0)
  String? get id;

  /// Category Nft
  @override
  @HiveField(3)
  int? get categoryNftIndex;

  /// Favorite
  @override
  @HiveField(4)
  bool? get favorite;

  /// Create a copy of NftInfosOffChain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftInfosOffChainImplCopyWith<_$NftInfosOffChainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
