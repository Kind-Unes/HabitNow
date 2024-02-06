import 'package:flutter/material.dart';
import 'package:habit_now/src/presentation/shared/bottomSheets.dart';
import 'package:habit_now/src/presentation/shared/components/BottomNavbar.dart';
import 'package:habit_now/src/presentation/shared/components/drawer.dart';
import 'package:habit_now/src/presentation/tasks/components/tasks_appBar.dart';
import 'package:habit_now/src/presentation/tasks/components/tasks_body.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(),
        drawer: const DrawerWidget(),
        appBar: TasksAppBar(
          context: context,
        ),
        body: const TasksBody(),
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.height * 0.082,
      height: context.height * 0.082,
      child: FloatingActionButton(
          backgroundColor: AppColors.kpurpleOn,
          elevation: 0,
          onPressed: () {
            context.showBottmSheet(const FloatingActionButtonBottomSheet());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: context.height * 0.04,
            ),
          )),
    );
  }
}
