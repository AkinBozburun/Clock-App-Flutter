// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<Alarm> {
  @override
  final int typeId = 1;

  @override
  Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alarm()
      ..alarmName = fields[0] as String
      ..hour = fields[1] as int
      ..minute = fields[2] as int
      ..isActive = fields[3] as bool
      ..days = (fields[4] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList();
  }

  @override
  void write(BinaryWriter writer, Alarm obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.alarmName)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.minute)
      ..writeByte(3)
      ..write(obj.isActive)
      ..writeByte(4)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
