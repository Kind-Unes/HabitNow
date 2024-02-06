import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      // SingleTasksEmptyPage(), //empty logic later
      SingleTasksPage(),
      RecurringTasksPage(),
    ]);
  }
}

class SingleTasksPage extends StatelessWidget {
  const SingleTasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.015),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TaskDate(text: "Today"),
          TaskTile(),
          TaskDate(text: "Feb 7,2024"),
          TaskTile(),
          TaskTile(),
          TaskTile(),
          TaskTile(),
        ],
      ),
    );
  }
}

class TaskDate extends StatelessWidget {
  const TaskDate({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: context.height * 0.011, bottom: context.height * 0.015),
      alignment: Alignment.center,
      height: context.height * 0.03,
      width: text.length.toDouble() * 11,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.height * 0.03),
          color: const Color.fromARGB(255, 36, 36, 36)),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.kBackgroundColor,
      child: InkWell(
        onTap: () {
          context.pushNamed("/edit_task");
        },
        child: Container(
          height: context.height * 0.08,
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 66, 66, 66), width: 0.3),
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 66, 66, 66), width: 0.3))),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: context.height * 0.05,
                  width: context.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.money),
                ),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Text(
                  "ur mom is nice",
                  style: TextStyle(
                      fontSize: context.fontSize / 1.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ]),
        ),
      ),
    );
  }
}

// Single Tasks
class SingleTasksEmptyPage extends StatelessWidget {
  const SingleTasksEmptyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add_task_sharp,
            color: Colors.grey,
            size: 100,
          ),
          SizedBox(
            height: context.height * 0.015,
          ),
          const Text(
            "No tasks",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.height * 0.008,
          ),
          Text(
            "There are no upcoming tasks",
            style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: context.height * 0.1,
          )
        ],
      ),
    );
  }
}

// Recurring tasks
class RecurringTasksPage extends StatelessWidget {
  const RecurringTasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
