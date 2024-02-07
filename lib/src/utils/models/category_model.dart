import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  Color color;
  @HiveField(1)
  IconData icon;
  @HiveField(2)
  String name;


  CategoryModel({
    required this.color,
    required this.icon,
    required this.name,
  });
}
  