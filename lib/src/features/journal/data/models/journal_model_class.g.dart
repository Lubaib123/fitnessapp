// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_model_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalModelClassAdapter extends TypeAdapter<JournalModelClass> {
  @override
  final int typeId = 0;

  @override
  JournalModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalModelClass()
      ..name = fields[0] as String
      ..jouralDate = fields[1] as DateTime
      ..moodid = fields[2] as int
      ..journalText = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, JournalModelClass obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.jouralDate)
      ..writeByte(2)
      ..write(obj.moodid)
      ..writeByte(3)
      ..write(obj.journalText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
