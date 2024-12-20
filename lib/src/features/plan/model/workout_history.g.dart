// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutHistoryAdapter extends TypeAdapter<WorkoutHistory> {
  @override
  final int typeId = 1;

  @override
  WorkoutHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutHistory(
      date: fields[0] as DateTime,
      status: fields[1] == null
          ? WorkoutStatusEnum.notCompleted
          : fields[1] as WorkoutStatusEnum,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkoutStatusEnumAdapter extends TypeAdapter<WorkoutStatusEnum> {
  @override
  final int typeId = 2;

  @override
  WorkoutStatusEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WorkoutStatusEnum.completed;
      case 1:
        return WorkoutStatusEnum.notCompleted;
      default:
        return WorkoutStatusEnum.completed;
    }
  }

  @override
  void write(BinaryWriter writer, WorkoutStatusEnum obj) {
    switch (obj) {
      case WorkoutStatusEnum.completed:
        writer.writeByte(0);
        break;
      case WorkoutStatusEnum.notCompleted:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutStatusEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
