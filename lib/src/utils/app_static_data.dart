import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    color: const Color.fromARGB(255, 255, 89, 0),
    icon: Icons.block,
    name: 'Quit a bad habit',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 167, 14, 60),
    icon: Icons.brush,
    name: 'Art',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 220, 21, 81),
    icon: Icons.timer_outlined,
    name: 'Task',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 4, 144),
    icon: Icons.self_improvement,
    name: 'Meditation',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 53, 4, 159),
    icon: Icons.school,
    name: 'Study',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 4, 105, 159),
    icon: Icons.directions_bike,
    name: 'Sports',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 4, 159, 133),
    icon: Icons.local_activity,
    name: 'Entertainment',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 4, 144),
    icon: Icons.speaker_notes,
    name: 'Social',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 4, 159, 45),
    icon: Icons.speaker_notes,
    name: 'Social',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 100, 159, 4),
    icon: Icons.attach_money_outlined,
    name: 'Finance',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 4, 4),
    icon: Icons.add,
    name: 'Health',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 4, 144),
    icon: Icons.work_outlined,
    name: 'Work',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 100, 4),
    icon: Icons.restaurant_menu,
    name: 'Nurtrition',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 4, 32, 159),
    icon: Icons.home,
    name: 'Home',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 4, 159, 51),
    icon: Icons.filter_hdr,
    name: 'Outdoors',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 159, 4, 14),
    icon: Icons.energy_savings_leaf_rounded,
    name: 'Energy',
  ),
  CategoryModel(
    color: const Color.fromARGB(255, 118, 159, 4),
    icon: Icons.category,
    name: 'Other',
  ),
];
