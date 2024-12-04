// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalBookModelAdapter extends TypeAdapter<LocalBookModel> {
  @override
  final int typeId = 1;

  @override
  LocalBookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalBookModel()
      ..title = fields[0] as String
      ..category = fields[1] as String
      ..summary = fields[2] as String
      ..review = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, LocalBookModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.review);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalBookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
