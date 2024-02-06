import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/today/todayListView_cubit.dart';
import 'package:habit_now/src/presentation/shared/components/BottomNavbar.dart';
import 'package:habit_now/src/presentation/shared/components/drawer.dart';
import 'package:habit_now/src/presentation/tasks/tasks_page.dart';
import 'package:habit_now/src/presentation/today/components/today_widgets.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:intl/intl.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayListViewCubit, TodayListViewState>(
      builder: (context, listViewState) {
        return Scaffold(
            drawer: const DrawerWidget(),
            bottomNavigationBar: const CustomBottomNavBar(),
            floatingActionButton: const CustomFloatingActionButton(),
            appBar: TodayAppBar(
              context: context,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: context.height * 0.087,
                  child: ListView.builder(
                    controller: ScrollController(
                        initialScrollOffset: 100 * context.height * 0.067 +
                            100 * 5 -
                            context.height * 0.067 * 3),
                    scrollDirection: Axis.horizontal,
                    itemCount: 201,
                    itemBuilder: (context, index) => TodayListViewElement(
                      isSelected: listViewState.currentIndex == index,
                      index: index,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class TodayListViewElement extends StatelessWidget {
  const TodayListViewElement({
    Key? key,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  final bool isSelected; //100 default value + the drawer logic
  final int index;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = currentDate.add(Duration(days: index - 100));

    return GestureDetector(
      onTap: () {
        context.read<TodayListViewCubit>().updateSelection(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        height: context.height * 0.086,
        width: context.height * 0.067,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? const Color.fromARGB(255, 162, 19, 67)
              : const Color.fromARGB(255, 30, 30, 30),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  DateFormat('EEE').format(targetDate),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: context.height * 0.017,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: isSelected
                      ? const Color.fromARGB(255, 121, 14, 50)
                      : AppColors.kGray,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.007,
                    ),
                    Text(
                      targetDate.day.toString(), // Display day number
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 15,
                      height: 2,
                      decoration: BoxDecoration(
                          color:
                              index == 100 ? Colors.grey : Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
