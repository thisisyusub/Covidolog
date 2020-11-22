// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azerbaijan_stat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzerbaijanStatAdapter extends TypeAdapter<AzerbaijanStat> {
  @override
  final int typeId = 0;

  @override
  AzerbaijanStat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzerbaijanStat(
      totalCasesCount: fields[0] as String,
      totalHealedCount: fields[1] as String,
      newCasesCount: fields[2] as String,
      activeCasesCount: fields[3] as String,
      totalDeathCount: fields[4] as String,
      totalTestsCount: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AzerbaijanStat obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.totalCasesCount)
      ..writeByte(1)
      ..write(obj.totalHealedCount)
      ..writeByte(2)
      ..write(obj.newCasesCount)
      ..writeByte(3)
      ..write(obj.activeCasesCount)
      ..writeByte(4)
      ..write(obj.totalDeathCount)
      ..writeByte(5)
      ..write(obj.totalTestsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzerbaijanStatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
