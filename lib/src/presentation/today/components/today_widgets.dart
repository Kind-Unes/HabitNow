import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class TodayAppBar extends StatelessWidget implements PreferredSize {
  const TodayAppBar({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.13);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Transform.translate(
          offset: const Offset(-25, 0),
          child: const Text(
            "  Today",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 173, 171, 171),
            iconSize: Sizes.kActionIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month_outlined),
            color: const Color.fromARGB(255, 173, 171, 171),
            iconSize: Sizes.kActionIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.question_mark_sharp),
            color: const Color.fromARGB(255, 173, 171, 171),
            iconSize: Sizes.kActionIcon,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.list,
            size: 35,
            color: Color.fromARGB(255, 228, 33, 98),
          ),
        ),
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 122, 115, 115));
  }
}
