// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountTokenImplAdapter extends TypeAdapter<_$AccountTokenImpl> {
  @override
  final int typeId = 8;

  @override
  _$AccountTokenImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AccountTokenImpl(
      tokenInformation: fields[7] as TokenInformation?,
      amount: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AccountTokenImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(7)
      ..write(obj.tokenInformation)
      ..writeByte(8)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountTokenImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountTokenImpl _$$AccountTokenImplFromJson(Map<String, dynamic> json) =>
    _$AccountTokenImpl(
      tokenInformation: json['tokenInformation'] == null
          ? null
          : TokenInformation.fromJson(
              json['tokenInformation'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AccountTokenImplToJson(_$AccountTokenImpl instance) =>
    <String, dynamic>{
      'tokenInformation': instance.tokenInformation,
      'amount': instance.amount,
    };
