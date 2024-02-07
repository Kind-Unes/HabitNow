// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part "task_model.g.dart";

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(7)
  final String id;
  @HiveField(0)
  final String name;
  @HiveField(1)
  final CategoryModel category;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final ReminderModel reminder;
  @HiveField(4)
  final int priority;
  @HiveField(5)
  final String note;
  @HiveField(6)
  final bool isPendingTask;

  TaskModel({
    required this.name,
    required this.id,
    required this.category,
    required this.date,
    required this.reminder,
    required this.priority,
    required this.note,
    required this.isPendingTask,
  });
  TaskModel copyWith({
    String? name,
    String? id,
    CategoryModel? category,
    DateTime? date,
    ReminderModel? reminder,
    int? priority,
    String? note,
    bool? isPendingTask,
  }) {
    return TaskModel(
      name: name ?? this.name,
      category: category ?? this.category,
      date: date ?? this.date,
      reminder: reminder ?? this.reminder,
      priority: priority ?? this.priority,
      note: note ?? this.note,
      isPendingTask: isPendingTask ?? this.isPendingTask,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category.toMap(),
      'date': date.millisecondsSinceEpoch,
      'reminder': reminder.toMap(),
      'priority': priority,
      'note': note,
      'isPendingTask': isPendingTask,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      name: map['name'] as String,
      id: map['id'] as String,
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      reminder: ReminderModel.fromMap(map['reminder'] as Map<String, dynamic>),
      priority: map['priority'] as int,
      note: map['note'] as String,
      isPendingTask: map['isPendingTask'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(name: $name, category: $category, date: $date, reminder: $reminder, priority: $priority, note: $note, isPendingTask: $isPendingTask)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.category == category &&
        other.date == date &&
        other.reminder == reminder &&
        other.priority == priority &&
        other.note == note &&
        other.isPendingTask == isPendingTask;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        date.hashCode ^
        reminder.hashCode ^
        priority.hashCode ^
        note.hashCode ^
        isPendingTask.hashCode;
  }
}

@HiveType(typeId: 1)
class ReminderModel {
  @HiveField(0)
  final DateTime time;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String schedule;

  ReminderModel({
    required this.time,
    required this.type,
    required this.schedule,
  });

  ReminderModel copyWith({
    DateTime? time,
    String? type,
    String? schedule,
  }) {
    return ReminderModel(
      time: time ?? this.time,
      type: type ?? this.type,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'type': type,
      'schedule': schedule,
    };
  }

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      type: map['type'] as String,
      schedule: map['schedule'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderModel.fromJson(String source) =>
      ReminderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReminderModel(time: $time, type: $type, schedule: $schedule)';

  @override
  bool operator ==(covariant ReminderModel other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.type == type &&
        other.schedule == schedule;
  }

  @override
  int get hashCode => time.hashCode ^ type.hashCode ^ schedule.hashCode;
}

//? Category Model
@HiveType(typeId: 2)
class CategoryModel {
  @HiveField(0)
  final Color color;
  @HiveField(1)
  final IconData icon;
  @HiveField(2)
  final String name;

  CategoryModel({
    required this.color,
    required this.icon,
    required this.name,
  });
  CategoryModel copyWith({
    Color? color,
    IconData? icon,
    String? name,
  }) {
    return CategoryModel(
      color: color ?? this.color,
      icon: icon ?? this.icon,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color.value,
      'icon': icon.codePoint,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      color: Color(map['color'] as int),
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(color: $color, icon: $icon, name: $name)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.color == color && other.icon == icon && other.name == name;
  }

  @override
  int get hashCode => color.hashCode ^ icon.hashCode ^ name.hashCode;
}

//? ReminderModel
// Use Enum better BUT you have to solve the toMap issue :(
class ReminderSchedule {
  static const alwaysEnabled = "Always Enabled";
  static const specifcDaysOfTheWeek = "Specifc days of the week";
  static const daysBefore = "Days before";
}

class ReminderTime {
  static const dontRemind = "Don't remind";
  static const notifications = "Notifications";
  static const alarm = "Alarm";
}

class TimerRecordModel {
  final String record;
  final bool isSaved;
  TimerRecordModel({
    required this.record,
    required this.isSaved,
  });
}
