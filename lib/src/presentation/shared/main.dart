import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/main/bottomNavBar_cubit.dart';
import 'package:habit_now/src/presentation/habits_page/habitspage.dart';
import 'package:habit_now/src/presentation/tasks/tasks_page.dart';
import 'package:habit_now/src/presentation/today/today_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, indexState) {
        return Scaffold(
          body: GetBody(state: indexState), // _getBody();
        );
      },
    );
  }
}

class GetBody extends StatelessWidget {
  const GetBody({
    super.key,
    required this.state,
  });

  final BottomNavBarState state;

  @override
  Widget build(BuildContext context) {
    if (state.currentIndex == 0) {
      return const TodayPage();
    } else if (state.currentIndex == 1) {
      return const HabitsPage();
    } else {
      return const TasksPage();
    }
  }
}
