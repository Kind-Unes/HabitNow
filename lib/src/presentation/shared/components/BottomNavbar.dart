import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/main/bottomNavBar_cubit.dart';
import 'package:habit_now/src/utils/extentions.dart';

class CustomBottomNavTab extends StatelessWidget {
  const CustomBottomNavTab({
    super.key,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.function,
  });

  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width / 5,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(500),
            color: isSelected
                ? const Color.fromARGB(255, 98, 35, 57)
                : const Color.fromARGB(255, 28, 28, 28),
            child: InkWell(
              borderRadius: BorderRadius.circular(500),
              onTap: function,
              child: Container(
                width: double.infinity,
                height: context.height * 0.047,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Icon(icon,
                    size: 30,
                    color: isSelected
                        ? const Color.fromARGB(255, 255, 15, 99)
                        : Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 15, 99)
                    : Colors.grey),
          )
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavBarCubit pageIndexCubit =
        BlocProvider.of<BottomNavBarCubit>(context);

    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, pageIndex) {
        return Container(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          width: double.infinity,
          height: context.height * 0.13,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 28, 28, 28)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomBottomNavTab(
              isSelected: pageIndex.currentIndex == 0,
              text: 'Today',
              icon: Icons.featured_play_list,
              function: () {
                pageIndexCubit.updateIndex(0);
              },
            ),
            CustomBottomNavTab(
              isSelected: pageIndex.currentIndex == 1,
              text: 'Habits',
              icon: Icons.workspace_premium_outlined,
              function: () {
                pageIndexCubit.updateIndex(1);
                debugPrint(pageIndex.currentIndex.toString());
              },
            ),
            CustomBottomNavTab(
              isSelected: pageIndex.currentIndex == 2,
              text: 'Tasks',
              icon: Icons.check_circle_outline,
              function: () {
                pageIndexCubit.updateIndex(2);
              },
            ),
            CustomBottomNavTab(
              isSelected: false,
              text: 'Categories',
              icon: Icons.grid_view,
              function: () {
                context.pushNamed("/categories");
              },
            ),
            CustomBottomNavTab(
              isSelected: false,
              text: 'Timer',
              icon: Icons.timer_outlined,
              function: () {
                context.pushNamed("/timer");
              },
            ),
          ]),
        );
      },
    );
  }
}
