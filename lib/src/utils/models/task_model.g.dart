// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      name: fields[0] as String,
      id: fields[7] as String,
      category: fields[1] as CategoryModel,
      date: fields[2] as DateTime,
      reminder: fields[3] as ReminderModel,
      priority: fields[4] as int,
      note: fields[5] as String,
      isPendingTask: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.reminder)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.isPendingTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 1;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      time: fields[0] as DateTime,
      type: fields[1] as String,
      schedule: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.schedule);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 2;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      id: fields[3] as String,
      color: fields[0] as Color,
      icon: fields[1] as IconData,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  final int typeId =
      99; // You can choose any unique positive integer as the type ID

  @override
  IconData read(BinaryReader reader) {
    final codePoint = reader.readInt();
    return IconData(codePoint, fontFamily: 'MaterialIcons');
  }

  @override
  void write(BinaryWriter writer, IconData value) {
    writer.writeInt(value.codePoint);
  }
}
