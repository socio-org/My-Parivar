// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavPostDataAdapter extends TypeAdapter<FavPostData> {
  @override
  final int typeId = 0;

  @override
  FavPostData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavPostData(
      images: (fields[0] as List?)?.cast<String>(),
      text: fields[1] as String?,
      fileUrl: fields[2] as String?,
      title: fields[3] as String?,
      personImageUrl: fields[4] as String?,
      personName: fields[5] as String?,
      time: fields[6] as DateTime?,
      groupName: fields[7] as String?,
      groupAuthorName: fields[8] as String?,
      likes: fields[9] as int?,
      type: fields[10] as String?,
      id: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FavPostData obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.fileUrl)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.personImageUrl)
      ..writeByte(5)
      ..write(obj.personName)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.groupName)
      ..writeByte(8)
      ..write(obj.groupAuthorName)
      ..writeByte(9)
      ..write(obj.likes)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavPostDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
