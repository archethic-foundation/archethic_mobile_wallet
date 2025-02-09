// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenProperty {
  String get propertyName => throw _privateConstructorUsedError;
  dynamic get propertyValue => throw _privateConstructorUsedError;
  List<TokenPropertyAccess> get publicKeys =>
      throw _privateConstructorUsedError;

  /// Create a copy of TokenProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenPropertyCopyWith<TokenProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenPropertyCopyWith<$Res> {
  factory $TokenPropertyCopyWith(
          TokenProperty value, $Res Function(TokenProperty) then) =
      _$TokenPropertyCopyWithImpl<$Res, TokenProperty>;
  @useResult
  $Res call(
      {String propertyName,
      dynamic propertyValue,
      List<TokenPropertyAccess> publicKeys});
}

/// @nodoc
class _$TokenPropertyCopyWithImpl<$Res, $Val extends TokenProperty>
    implements $TokenPropertyCopyWith<$Res> {
  _$TokenPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyName = null,
    Object? propertyValue = freezed,
    Object? publicKeys = null,
  }) {
    return _then(_value.copyWith(
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      propertyValue: freezed == propertyValue
          ? _value.propertyValue
          : propertyValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      publicKeys: null == publicKeys
          ? _value.publicKeys
          : publicKeys // ignore: cast_nullable_to_non_nullable
              as List<TokenPropertyAccess>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenPropertyImplCopyWith<$Res>
    implements $TokenPropertyCopyWith<$Res> {
  factory _$$TokenPropertyImplCopyWith(
          _$TokenPropertyImpl value, $Res Function(_$TokenPropertyImpl) then) =
      __$$TokenPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String propertyName,
      dynamic propertyValue,
      List<TokenPropertyAccess> publicKeys});
}

/// @nodoc
class __$$TokenPropertyImplCopyWithImpl<$Res>
    extends _$TokenPropertyCopyWithImpl<$Res, _$TokenPropertyImpl>
    implements _$$TokenPropertyImplCopyWith<$Res> {
  __$$TokenPropertyImplCopyWithImpl(
      _$TokenPropertyImpl _value, $Res Function(_$TokenPropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyName = null,
    Object? propertyValue = freezed,
    Object? publicKeys = null,
  }) {
    return _then(_$TokenPropertyImpl(
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      propertyValue: freezed == propertyValue
          ? _value.propertyValue
          : propertyValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      publicKeys: null == publicKeys
          ? _value._publicKeys
          : publicKeys // ignore: cast_nullable_to_non_nullable
              as List<TokenPropertyAccess>,
    ));
  }
}

/// @nodoc

class _$TokenPropertyImpl extends _TokenProperty {
  const _$TokenPropertyImpl(
      {required this.propertyName,
      required this.propertyValue,
      required final List<TokenPropertyAccess> publicKeys})
      : _publicKeys = publicKeys,
        super._();

  @override
  final String propertyName;
  @override
  final dynamic propertyValue;
  final List<TokenPropertyAccess> _publicKeys;
  @override
  List<TokenPropertyAccess> get publicKeys {
    if (_publicKeys is EqualUnmodifiableListView) return _publicKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicKeys);
  }

  @override
  String toString() {
    return 'TokenProperty(propertyName: $propertyName, propertyValue: $propertyValue, publicKeys: $publicKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenPropertyImpl &&
            (identical(other.propertyName, propertyName) ||
                other.propertyName == propertyName) &&
            const DeepCollectionEquality()
                .equals(other.propertyValue, propertyValue) &&
            const DeepCollectionEquality()
                .equals(other._publicKeys, _publicKeys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      propertyName,
      const DeepCollectionEquality().hash(propertyValue),
      const DeepCollectionEquality().hash(_publicKeys));

  /// Create a copy of TokenProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenPropertyImplCopyWith<_$TokenPropertyImpl> get copyWith =>
      __$$TokenPropertyImplCopyWithImpl<_$TokenPropertyImpl>(this, _$identity);
}

abstract class _TokenProperty extends TokenProperty {
  const factory _TokenProperty(
          {required final String propertyName,
          required final dynamic propertyValue,
          required final List<TokenPropertyAccess> publicKeys}) =
      _$TokenPropertyImpl;
  const _TokenProperty._() : super._();

  @override
  String get propertyName;
  @override
  dynamic get propertyValue;
  @override
  List<TokenPropertyAccess> get publicKeys;

  /// Create a copy of TokenProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenPropertyImplCopyWith<_$TokenPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
