// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:habit_now/src/cubit/tasks_cubits/tasks_database_cubit.dart.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.015),
      child: BlocBuilder<TasksDatabaseCubit, List<TaskModel>>(
        builder: (context, tasksList) {
          Map<String, List<TaskModel>> groupedTasks = {};
          for (TaskModel task in tasksList) {
            String formattedDate = _formatDate(task.date);
            groupedTasks.putIfAbsent(formattedDate, () => []);
            groupedTasks[formattedDate]!.add(task);
          }

          List<String> uniqueDates = groupedTasks.keys.toList();

          return uniqueDates.isEmpty
              ? const SingleTasksEmptyPage()
              : ListView.builder(
                  itemCount: uniqueDates.length * 2 - 1,
                  itemBuilder: (context, index) {
                    if (index.isOdd) {
                      return Container();
                    } else {
                      int taskIndex = index ~/ 2;
                      String currentDate = uniqueDates[taskIndex];
                      bool isToday = _isToday(currentDate);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskDate(text: isToday ? 'Today' : currentDate),
                          ...groupedTasks[currentDate]!
                              .map((task) => TaskTile(taskModel: task)),
                        ],
                      );
                    }
                  },
                );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Check if the date is today
    if (_isToday(_formattedToday(date))) {
      return 'Today';
    } else {
      // Format DateTime to a string representation (e.g., Feb 9, 2024)
      return "${_getMonthName(date.month)} ${date.day},${date.year}";
    }
  }

  String _formattedToday(DateTime date) {
    return "${date.month}-${date.day}-${date.year}";
  }

  bool _isToday(String formattedDate) {
    String formattedToday = _formattedToday(DateTime.now());
    return formattedDate == formattedToday;
  }

  String _getMonthName(int month) {
    // Returns the name of the month based on its number
    const monthNames = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthNames[month];
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
          top: context.height * 0.015, bottom: context.height * 0.02),
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
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.kBackgroundColor,
      child: InkWell(
        onTap: () {
          context.pushNamed("/edit_task", arguments: taskModel);
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
                      color: taskModel.category.color,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(taskModel.category.icon),
                ),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Text(
                  taskModel.name,
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

//? Recurring tasks
class RecurringTasksPage extends StatelessWidget {
  const RecurringTasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.green,
                icon: Icons.abc,
              )
            ],
          ),
          child: Container(
            // Your content goes here
            child: ListTile(
              title: Text('Item $index'),
            ),
          ),
        );
      },
    );
  }
}
