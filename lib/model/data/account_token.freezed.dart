// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountToken _$AccountTokenFromJson(Map<String, dynamic> json) {
  return _AccountToken.fromJson(json);
}

/// @nodoc
mixin _$AccountToken {
  @HiveField(7)
  TokenInformation? get tokenInformation => throw _privateConstructorUsedError;
  @HiveField(8)
  double? get amount => throw _privateConstructorUsedError;

  /// Serializes this AccountToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountTokenCopyWith<AccountToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountTokenCopyWith<$Res> {
  factory $AccountTokenCopyWith(
          AccountToken value, $Res Function(AccountToken) then) =
      _$AccountTokenCopyWithImpl<$Res, AccountToken>;
  @useResult
  $Res call(
      {@HiveField(7) TokenInformation? tokenInformation,
      @HiveField(8) double? amount});

  $TokenInformationCopyWith<$Res>? get tokenInformation;
}

/// @nodoc
class _$AccountTokenCopyWithImpl<$Res, $Val extends AccountToken>
    implements $AccountTokenCopyWith<$Res> {
  _$AccountTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenInformation = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      tokenInformation: freezed == tokenInformation
          ? _value.tokenInformation
          : tokenInformation // ignore: cast_nullable_to_non_nullable
              as TokenInformation?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenInformationCopyWith<$Res>? get tokenInformation {
    if (_value.tokenInformation == null) {
      return null;
    }

    return $TokenInformationCopyWith<$Res>(_value.tokenInformation!, (value) {
      return _then(_value.copyWith(tokenInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountTokenImplCopyWith<$Res>
    implements $AccountTokenCopyWith<$Res> {
  factory _$$AccountTokenImplCopyWith(
          _$AccountTokenImpl value, $Res Function(_$AccountTokenImpl) then) =
      __$$AccountTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(7) TokenInformation? tokenInformation,
      @HiveField(8) double? amount});

  @override
  $TokenInformationCopyWith<$Res>? get tokenInformation;
}

/// @nodoc
class __$$AccountTokenImplCopyWithImpl<$Res>
    extends _$AccountTokenCopyWithImpl<$Res, _$AccountTokenImpl>
    implements _$$AccountTokenImplCopyWith<$Res> {
  __$$AccountTokenImplCopyWithImpl(
      _$AccountTokenImpl _value, $Res Function(_$AccountTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenInformation = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$AccountTokenImpl(
      tokenInformation: freezed == tokenInformation
          ? _value.tokenInformation
          : tokenInformation // ignore: cast_nullable_to_non_nullable
              as TokenInformation?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.accountToken)
class _$AccountTokenImpl implements _AccountToken {
  _$AccountTokenImpl(
      {@HiveField(7) this.tokenInformation, @HiveField(8) this.amount});

  factory _$AccountTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountTokenImplFromJson(json);

  @override
  @HiveField(7)
  final TokenInformation? tokenInformation;
  @override
  @HiveField(8)
  final double? amount;

  @override
  String toString() {
    return 'AccountToken(tokenInformation: $tokenInformation, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountTokenImpl &&
            (identical(other.tokenInformation, tokenInformation) ||
                other.tokenInformation == tokenInformation) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenInformation, amount);

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountTokenImplCopyWith<_$AccountTokenImpl> get copyWith =>
      __$$AccountTokenImplCopyWithImpl<_$AccountTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountTokenImplToJson(
      this,
    );
  }
}

abstract class _AccountToken implements AccountToken {
  factory _AccountToken(
      {@HiveField(7) final TokenInformation? tokenInformation,
      @HiveField(8) final double? amount}) = _$AccountTokenImpl;

  factory _AccountToken.fromJson(Map<String, dynamic> json) =
      _$AccountTokenImpl.fromJson;

  @override
  @HiveField(7)
  TokenInformation? get tokenInformation;
  @override
  @HiveField(8)
  double? get amount;

  /// Create a copy of AccountToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountTokenImplCopyWith<_$AccountTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
