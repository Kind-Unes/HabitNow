// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habit_now/src/utils/models/task_model.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum EvaluationProgress {
  withYesOrNo,
  withACheckList,
}

class ReccurringTask {
  final CategoryModel category;
  final EvaluationProgress progressEvaluation;
  final String taskName;
  final String note;
  final HowToDoIt howToDoIt;
  final WhenToDoIT whenToDoIT;

  ReccurringTask(
      {required this.category,
      required this.progressEvaluation,
      required this.taskName,
      required this.note,
      required this.howToDoIt,
      required this.whenToDoIT});
}

//!     W H E N    T O    D O       I T            SHIT

class WhenToDoIT {
  final DateTime startDate;
  final DateTime endDate;
  final ReminderModel rminder;
  final int priority;

  WhenToDoIT(
      {required this.startDate,
      required this.endDate,
      required this.rminder,
      required this.priority});
}

//!     H O W    T O    D O       I T            SHIT

// NOT required paramaters
class HowToDoIt {
  //required
  final int choice;

  //not required
  final bool? everyDay;
  final SpecifcDaysOfTheWeek? specifcDaysOfTheWeek;
  final SpecificDaysOfTheMonth? specificDaysOfTheMonth;
  final SpecificDaysOfTheYear? specificDaysOfTheYear;
  final SomeDaysPerPeriod? someDaysPerPeriod;
  final Reapeat? reapeat;

  HowToDoIt(
      {required this.choice,
      this.everyDay,
      this.specifcDaysOfTheWeek,
      this.specificDaysOfTheMonth,
      this.specificDaysOfTheYear,
      this.someDaysPerPeriod,
      this.reapeat});
}

// Supposed not required + the other
class Reapeat {
  //required
  final bool isAlternateDays;

  //Not required
  // isAlternateDays == true
  final AlternateDays? alternateDays;

  // isAlternateDays == false
  final NotAlternateDays? notAlternateDays;

  Reapeat(
      {required this.isAlternateDays,
      this.alternateDays,
      this.notAlternateDays});
}

class NotAlternateDays {
  final bool isFlexible;
  //every
  final int times;

  NotAlternateDays({required this.isFlexible, required this.times});
  //days
}

class AlternateDays {
  final int activity;
  // x
  final int rest;

  AlternateDays({required this.activity, required this.rest});
}

class SomeDaysPerPeriod {
  final int number;
  //days per
  final Period period;

  SomeDaysPerPeriod({required this.number, required this.period});
}

enum Period { week, month, year }

//Required
class SpecificDaysOfTheYear {
  final bool isFlexible;
  final UseDaysOfTheWeekYear useDaysOfTheWeekYear;

  SpecificDaysOfTheYear(
      {required this.isFlexible, required this.useDaysOfTheWeekYear});
}

class UseDaysOfTheWeekYear {
  final Month month;
  final int dayOfMonth;

  UseDaysOfTheWeekYear({required this.month, required this.dayOfMonth});
}

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

class SpecificDaysOfTheMonth {
  final bool isUseDaysOfWeek;

  final bool? isFlexible;

  // isUseDaysOfWeek == false
  final UseDaysOfTheWeekMonth? useDaysOfTheWeek;

  // isUseDaysOfWeek == false
  final List<int>? monthDays;
  //32 == Last
  SpecificDaysOfTheMonth({
    required this.isUseDaysOfWeek,
    this.isFlexible,
    this.useDaysOfTheWeek,
    this.monthDays,
  });
}

class UseDaysOfTheWeekMonth {
  final DayOfWeek dayOfWeek;
  final DayOfMonth dayOfMonth;

  UseDaysOfTheWeekMonth({required this.dayOfWeek, required this.dayOfMonth});
}

enum DayOfMonth { first, second, third, fourth, fifth, last }

class SpecifcDaysOfTheWeek {
  final List<DayOfWeek> weekDays;
  final bool isFlexible;

  SpecifcDaysOfTheWeek({required this.weekDays, required this.isFlexible});
}
