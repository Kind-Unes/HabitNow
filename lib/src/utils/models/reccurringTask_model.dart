// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/models/task_model.dart';
import 'package:hive/hive.dart';

part "reccurringTask_model.g.dart";

// Existing enum definitions...

enum DayOfMonth { first, second, third, fourth, fifth, last }

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

enum Period { week, month, year }

enum EvaluationProgress {
  withYesOrNo,
  withACheckList,
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum WhenToDoItType {
  specific,
  flexible,
}

@HiveType(typeId: 6)
class ReminderModel {
  // Add your ReminderModel class properties here
}

@HiveType(typeId: 7)
class ReccurringTaskModel {
  @HiveField(0)
  final CategoryModel category;
  @HiveField(1)
  final EvaluationProgress progressEvaluation;
  @HiveField(2)
  final String taskName;
  @HiveField(3)
  final String note;
  @HiveField(4)
  final HowToDoIt howToDoIt;
  @HiveField(5)
  final WhenToDoIT whenToDoIT;
  @HiveField(6)
  final String id;

  ReccurringTaskModel({
    required this.category,
    required this.id,
    required this.progressEvaluation,
    required this.taskName,
    required this.note,
    required this.howToDoIt,
    required this.whenToDoIT,
  });
}

@HiveType(typeId: 8)
class WhenToDoIT {
  @HiveField(0)
  final DateTime startDate;
  @HiveField(1)
  final DateTime endDate;
  @HiveField(2)
  final ReminderModel reminder;
  @HiveField(3)
  final int priority;
  @HiveField(4)
  final WhenToDoItType type;

  WhenToDoIT({
    required this.startDate,
    required this.endDate,
    required this.reminder,
    required this.priority,
    required this.type,
  });
}

@HiveType(typeId: 9)
class HowToDoIt {
  @HiveField(0)
  final int choice;
  @HiveField(1)
  final bool? everyDay;
  @HiveField(2)
  final SpecifcDaysOfTheWeek? specificDaysOfTheWeek;
  @HiveField(3)
  final SpecificDaysOfTheMonth? specificDaysOfTheMonth;
  @HiveField(4)
  final SpecificDaysOfTheYear? specificDaysOfTheYear;
  @HiveField(5)
  final SomeDaysPerPeriod? someDaysPerPeriod;
  @HiveField(6)
  final Reapeat? repeat;

  HowToDoIt({
    required this.choice,
    this.everyDay,
    this.specificDaysOfTheWeek,
    this.specificDaysOfTheMonth,
    this.specificDaysOfTheYear,
    this.someDaysPerPeriod,
    this.repeat,
  });
}

@HiveType(typeId: 10)
class Reapeat {
  @HiveField(0)
  final bool isAlternateDays;
  @HiveField(1)
  final AlternateDays? alternateDays;
  @HiveField(2)
  final NotAlternateDays? notAlternateDays;

  Reapeat({
    required this.isAlternateDays,
    this.alternateDays,
    this.notAlternateDays,
  });
}

@HiveType(typeId: 11)
class NotAlternateDays {
  @HiveField(0)
  final bool isFlexible;
  @HiveField(1)
  final int times;

  NotAlternateDays({
    required this.isFlexible,
    required this.times,
  });
}

@HiveType(typeId: 12)
class AlternateDays {
  @HiveField(0)
  final int activity;
  @HiveField(1)
  final int rest;

  AlternateDays({
    required this.activity,
    required this.rest,
  });
}

@HiveType(typeId: 13)
class SomeDaysPerPeriod {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final Period period;

  SomeDaysPerPeriod({
    required this.number,
    required this.period,
  });
}

@HiveType(typeId: 14)
class SpecificDaysOfTheYear {
  @HiveField(0)
  final bool isFlexible;
  @HiveField(1)
  final UseDaysOfTheWeekYear useDaysOfTheWeekYear;

  SpecificDaysOfTheYear({
    required this.isFlexible,
    required this.useDaysOfTheWeekYear,
  });
}

@HiveType(typeId: 15)
class UseDaysOfTheWeekYear {
  @HiveField(0)
  final Month month;
  @HiveField(1)
  final int dayOfMonth;

  UseDaysOfTheWeekYear({
    required this.month,
    required this.dayOfMonth,
  });
}

@HiveType(typeId: 16)
class SpecificDaysOfTheMonth {
  @HiveField(0)
  final bool isUseDaysOfWeek;
  @HiveField(1)
  final bool? isFlexible;
  @HiveField(2)
  final UseDaysOfTheWeekMonth? useDaysOfTheWeek;
  @HiveField(3)
  final List<int>? monthDays;

  SpecificDaysOfTheMonth({
    required this.isUseDaysOfWeek,
    this.isFlexible,
    this.useDaysOfTheWeek,
    this.monthDays,
  });
}

@HiveType(typeId: 17)
class UseDaysOfTheWeekMonth {
  @HiveField(0)
  final DayOfWeek dayOfWeek;
  @HiveField(1)
  final DayOfMonth dayOfMonth;

  UseDaysOfTheWeekMonth({
    required this.dayOfWeek,
    required this.dayOfMonth,
  });
}

@HiveType(typeId: 18)
class SpecifcDaysOfTheWeek {
  @HiveField(0)
  final List<DayOfWeek> weekDays;
  @HiveField(1)
  final bool isFlexible;

  SpecifcDaysOfTheWeek({
    required this.weekDays,
    required this.isFlexible,
  });
}
