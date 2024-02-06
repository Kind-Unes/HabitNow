import 'package:flutter/material.dart';
import 'package:habit_now/src/presentation/shared/components/BottomNavbar.dart';
import 'package:habit_now/src/presentation/tasks/tasks_page.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
