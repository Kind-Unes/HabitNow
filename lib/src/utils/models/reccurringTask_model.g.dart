// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reccurringTask_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReccurringTaskModelAdapter extends TypeAdapter<ReccurringTaskModel> {
  @override
  final int typeId = 7;

  @override
  ReccurringTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReccurringTaskModel(
      category: fields[0] as CategoryModel,
      id: fields[6] as String,
      progressEvaluation: fields[1] as EvaluationProgress,
      taskName: fields[2] as String,
      note: fields[3] as String,
      howToDoIt: fields[4] as HowToDoIt,
      whenToDoIT: fields[5] as WhenToDoIT,
    );
  }

  @override
  void write(BinaryWriter writer, ReccurringTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.progressEvaluation)
      ..writeByte(2)
      ..write(obj.taskName)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.howToDoIt)
      ..writeByte(5)
      ..write(obj.whenToDoIT)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReccurringTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WhenToDoITAdapter extends TypeAdapter<WhenToDoIT> {
  @override
  final int typeId = 8;

  @override
  WhenToDoIT read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WhenToDoIT(
      startDate: fields[0] as DateTime,
      endDate: fields[1] as DateTime,
      reminder: fields[2] as ReminderModel,
      priority: fields[3] as int,
      type: fields[4] as WhenToDoItType,
    );
  }

  @override
  void write(BinaryWriter writer, WhenToDoIT obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.startDate)
      ..writeByte(1)
      ..write(obj.endDate)
      ..writeByte(2)
      ..write(obj.reminder)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WhenToDoITAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HowToDoItAdapter extends TypeAdapter<HowToDoIt> {
  @override
  final int typeId = 9;

  @override
  HowToDoIt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HowToDoIt(
      choice: fields[0] as int,
      everyDay: fields[1] as bool?,
      specificDaysOfTheWeek: fields[2] as SpecifcDaysOfTheWeek?,
      specificDaysOfTheMonth: fields[3] as SpecificDaysOfTheMonth?,
      specificDaysOfTheYear: fields[4] as SpecificDaysOfTheYear?,
      someDaysPerPeriod: fields[5] as SomeDaysPerPeriod?,
      repeat: fields[6] as Reapeat?,
    );
  }

  @override
  void write(BinaryWriter writer, HowToDoIt obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.choice)
      ..writeByte(1)
      ..write(obj.everyDay)
      ..writeByte(2)
      ..write(obj.specificDaysOfTheWeek)
      ..writeByte(3)
      ..write(obj.specificDaysOfTheMonth)
      ..writeByte(4)
      ..write(obj.specificDaysOfTheYear)
      ..writeByte(5)
      ..write(obj.someDaysPerPeriod)
      ..writeByte(6)
      ..write(obj.repeat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HowToDoItAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReapeatAdapter extends TypeAdapter<Reapeat> {
  @override
  final int typeId = 10;

  @override
  Reapeat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reapeat(
      isAlternateDays: fields[0] as bool,
      alternateDays: fields[1] as AlternateDays?,
      notAlternateDays: fields[2] as NotAlternateDays?,
    );
  }

  @override
  void write(BinaryWriter writer, Reapeat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isAlternateDays)
      ..writeByte(1)
      ..write(obj.alternateDays)
      ..writeByte(2)
      ..write(obj.notAlternateDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReapeatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotAlternateDaysAdapter extends TypeAdapter<NotAlternateDays> {
  @override
  final int typeId = 11;

  @override
  NotAlternateDays read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotAlternateDays(
      isFlexible: fields[0] as bool,
      times: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NotAlternateDays obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isFlexible)
      ..writeByte(1)
      ..write(obj.times);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotAlternateDaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlternateDaysAdapter extends TypeAdapter<AlternateDays> {
  @override
  final int typeId = 12;

  @override
  AlternateDays read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlternateDays(
      activity: fields[0] as int,
      rest: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AlternateDays obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activity)
      ..writeByte(1)
      ..write(obj.rest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlternateDaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SomeDaysPerPeriodAdapter extends TypeAdapter<SomeDaysPerPeriod> {
  @override
  final int typeId = 13;

  @override
  SomeDaysPerPeriod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SomeDaysPerPeriod(
      number: fields[0] as int,
      period: fields[1] as Period,
    );
  }

  @override
  void write(BinaryWriter writer, SomeDaysPerPeriod obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.period);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeDaysPerPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecificDaysOfTheYearAdapter extends TypeAdapter<SpecificDaysOfTheYear> {
  @override
  final int typeId = 14;

  @override
  SpecificDaysOfTheYear read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecificDaysOfTheYear(
      isFlexible: fields[0] as bool,
      useDaysOfTheWeekYear: fields[1] as UseDaysOfTheWeekYear,
    );
  }

  @override
  void write(BinaryWriter writer, SpecificDaysOfTheYear obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isFlexible)
      ..writeByte(1)
      ..write(obj.useDaysOfTheWeekYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecificDaysOfTheYearAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UseDaysOfTheWeekYearAdapter extends TypeAdapter<UseDaysOfTheWeekYear> {
  @override
  final int typeId = 15;

  @override
  UseDaysOfTheWeekYear read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UseDaysOfTheWeekYear(
      month: fields[0] as Month,
      dayOfMonth: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UseDaysOfTheWeekYear obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.dayOfMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UseDaysOfTheWeekYearAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecificDaysOfTheMonthAdapter
    extends TypeAdapter<SpecificDaysOfTheMonth> {
  @override
  final int typeId = 16;

  @override
  SpecificDaysOfTheMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecificDaysOfTheMonth(
      isUseDaysOfWeek: fields[0] as bool,
      isFlexible: fields[1] as bool?,
      useDaysOfTheWeek: fields[2] as UseDaysOfTheWeekMonth?,
      monthDays: (fields[3] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, SpecificDaysOfTheMonth obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isUseDaysOfWeek)
      ..writeByte(1)
      ..write(obj.isFlexible)
      ..writeByte(2)
      ..write(obj.useDaysOfTheWeek)
      ..writeByte(3)
      ..write(obj.monthDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecificDaysOfTheMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UseDaysOfTheWeekMonthAdapter extends TypeAdapter<UseDaysOfTheWeekMonth> {
  @override
  final int typeId = 17;

  @override
  UseDaysOfTheWeekMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UseDaysOfTheWeekMonth(
      dayOfWeek: fields[0] as DayOfWeek,
      dayOfMonth: fields[1] as DayOfMonth,
    );
  }

  @override
  void write(BinaryWriter writer, UseDaysOfTheWeekMonth obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dayOfWeek)
      ..writeByte(1)
      ..write(obj.dayOfMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UseDaysOfTheWeekMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecifcDaysOfTheWeekAdapter extends TypeAdapter<SpecifcDaysOfTheWeek> {
  @override
  final int typeId = 18;

  @override
  SpecifcDaysOfTheWeek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecifcDaysOfTheWeek(
      weekDays: (fields[0] as List).cast<DayOfWeek>(),
      isFlexible: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SpecifcDaysOfTheWeek obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.weekDays)
      ..writeByte(1)
      ..write(obj.isFlexible);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecifcDaysOfTheWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
