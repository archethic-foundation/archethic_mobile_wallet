// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_infos_off_chain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NftInfosOffChainImplAdapter extends TypeAdapter<_$NftInfosOffChainImpl> {
  @override
  final int typeId = 11;

  @override
  _$NftInfosOffChainImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NftInfosOffChainImpl(
      id: fields[0] as String?,
      categoryNftIndex: fields[3] as int?,
      favorite: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$NftInfosOffChainImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.categoryNftIndex)
      ..writeByte(4)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NftInfosOffChainImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftInfosOffChainImpl _$$NftInfosOffChainImplFromJson(
        Map<String, dynamic> json) =>
    _$NftInfosOffChainImpl(
      id: json['id'] as String?,
      categoryNftIndex: (json['categoryNftIndex'] as num?)?.toInt(),
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$$NftInfosOffChainImplToJson(
        _$NftInfosOffChainImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryNftIndex': instance.categoryNftIndex,
      'favorite': instance.favorite,
    };
