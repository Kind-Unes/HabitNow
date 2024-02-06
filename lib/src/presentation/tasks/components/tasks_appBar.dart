import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class TasksAppBar extends StatelessWidget implements PreferredSize {
  const TasksAppBar({
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
        bottom: const TabBar(
            // indicator: BoxDecoration(),
            overlayColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 68, 28, 41)),
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color.fromARGB(255, 182, 14, 70),
            unselectedLabelStyle: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
            labelStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            labelColor: Colors.white,
            tabs: [
              Tab(
                child: Text("Single tasks"),
              ),
              Tab(
                child: Text("Recurring tasks"),
              )
            ]),
        title: Transform.translate(
          offset: const Offset(-25, 0),
          child: const Text(
            " Tasks",
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
            icon: const Icon(Icons.filter_list_outlined),
            color: const Color.fromARGB(255, 173, 171, 171),
            iconSize: Sizes.kActionIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
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
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 122, 115, 115));
  }
}
