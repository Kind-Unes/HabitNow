import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/new_task_cubit.dart';
import 'package:habit_now/src/presentation/shared/dialogMessages.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/helpers.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskModel taskModel =
        ModalRoute.of(context)!.settings.arguments as TaskModel;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            color: AppColors.kLightPurple,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: context.height * 0.01),
                        height: context.height * 0.05,
                        width: context.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Edit Task",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: context.fontSize),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  const EditTaskTextFeild(),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  const EditTaskCategoryTile(),
                  const EditTaskDateTile(),
                  const EditTaskTimeTile(),
                  const EditTaskCheckListTile(),
                  const EditTaskPriorityTile(),
                  const EditTaskNoteTile(),
                  const EditTaskPendingTaskTile(),
                  const EditTaskDeleteNoteTile()
                ],
              ),
            ),
            const EditTaskButtons(),
          ],
        ),
      ),
    );
  }
}

class EditTaskTextFeild extends StatelessWidget {
  const EditTaskTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.height * 0.01),
      child: SizedBox(
        height: context.height * 0.065,
        child: TextField(
          focusNode: FocusNode(),
          onChanged: (newText) {},
          style: TextStyle(fontSize: context.fontSize * 1.1),
          autofocus: true,
          autocorrect: true,
          cursorColor: AppColors.kLightPurple,
          cursorHeight: context.height * 0.03,
          decoration: InputDecoration(
            isDense: true,
            labelText: 'Task',
            labelStyle: TextStyle(
                fontSize: context.fontSize, color: AppColors.kLightPurple),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kLightPurple, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kLightPurple, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kLightPurple, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kLightPurple, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class EditTaskDeleteNoteTile extends StatelessWidget {
  const EditTaskDeleteNoteTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {
              // do the stuff Deletion stuff
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.delete_outline,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}

class EditTaskButtons extends StatelessWidget {
  const EditTaskButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Material(
            color: AppColors.kBackgroundColor,
            child: InkWell(
              onTap: () {
                // discard the data model changes and then
                context.pop();
              },
              child: Container(
                height: context.height * 0.065,
                width: context.width / 2,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: Color.fromARGB(255, 79, 79, 79),
                    ),
                  ),
                ),
                child: Center(
                    child: Text(
                  "CANCEL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: context.fontSize * 0.9),
                )),
              ),
            ),
          ),
          Material(
            color: AppColors.kBackgroundColor,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: context.height * 0.065,
                width: context.width / 2,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: Color.fromARGB(255, 79, 79, 79),
                    ),
                  ),
                ),
                child: Center(
                    child: Text(
                  "CONFIRM",
                  style: TextStyle(
                      color: AppColors.kLightPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: context.fontSize * 0.9),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditTaskPendingTaskTile extends StatelessWidget {
  const EditTaskPendingTaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      builder: (context, taskModel) {
        return Material(
            color: AppColors.kBackgroundColor,
            child: InkWell(
                onTap: () {
                  context.read<NewTaskCubit>().updateProperty(
                      isPendingTask: !taskModel.taskModel.isPendingTask);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Color.fromARGB(255, 79, 79, 79),
                              width: 0.3))),
                  height: context.height * 0.085,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.height * 0.01),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Icon(
                              Icons.calendar_month_outlined,
                              size: context.height * 0.049 / 1.45,
                              color: const Color.fromARGB(255, 225, 23, 90),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Pending task",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "It will be shown each day until completed.",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: context.height * 0.005,
                              ),
                            ],
                          ),
                          const Spacer(),
                          taskModel.taskModel.isPendingTask
                              ? Container(
                                  height: context.height * 0.04,
                                  width: context.height * 0.04,
                                  decoration: BoxDecoration(
                                      color: AppColors.kLightPurple,
                                      borderRadius: BorderRadius.circular(500)),
                                  child: Center(
                                      child: Icon(
                                    Icons.check,
                                    color: AppColors.kBackgroundColor,
                                    size: context.fontSize * 1.5,
                                  )),
                                )
                              : Container(
                                  height: context.height * 0.04,
                                  width: context.height * 0.04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(600),
                                    border: Border.all(
                                        width: context.height * 0.005,
                                        color: const Color.fromARGB(
                                            255, 60, 60, 60)),
                                  ),
                                )
                        ]),
                  ),
                )));
      },
    );
  }
}

class EditTaskNoteTile extends StatelessWidget {
  const EditTaskNoteTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {
              context.showDialogMessage(const TextDialog(
                label: 'Note',
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.chat_outlined,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Note",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}

class EditTaskPriorityTile extends StatelessWidget {
  const EditTaskPriorityTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.flag_outlined,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Priority",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: context.height * 0.05,
                        width: context.height * 0.12,
                        decoration: BoxDecoration(
                            color: AppColors.kpurpleOff.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text("Default",
                              style: TextStyle(
                                  fontSize: context.fontSize / 1.15,
                                  color: AppColors.kLightPurple)),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

class EditTaskCheckListTile extends StatelessWidget {
  const EditTaskCheckListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.checklist_sharp,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Checklist",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Premuim feature",
                                style: TextStyle(
                                    color: AppColors.kLightPurple,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: context.height * 0.045,
                        width: context.height * 0.045,
                        decoration: BoxDecoration(
                            color: AppColors.kpurpleOff.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(500)),
                        child: Center(
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: context.fontSize / 1.15,
                                  color: AppColors.kLightPurple)),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

class EditTaskTimeTile extends StatelessWidget {
  const EditTaskTimeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {
              context.showDialogMessage(const TimeAndRemindersDialog());
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.notifications_none,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Time and reminders",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: context.height * 0.045,
                        width: context.height * 0.045,
                        decoration: BoxDecoration(
                            color: AppColors.kpurpleOff.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(500)),
                        child: Center(
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: context.fontSize / 1.15,
                                  color: AppColors.kLightPurple)),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

class EditTaskDateTile extends StatelessWidget {
  const EditTaskDateTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      builder: (context, taskModel) {
        return Material(
            color: AppColors.kBackgroundColor,
            child: InkWell(
                onTap: () async {
                  context.read<NewTaskCubit>().updateProperty(
                      date: await context.showDatePickerDialog());
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Color.fromARGB(255, 79, 79, 79),
                              width: 0.3))),
                  height: context.height * 0.085,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.height * 0.01),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Icon(
                              Icons.date_range_outlined,
                              size: context.height * 0.049 / 1.45,
                              color: const Color.fromARGB(255, 225, 23, 90),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: context.height * 0.005,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: context.height * 0.05,
                            width: context.height * 0.12,
                            decoration: BoxDecoration(
                                color: AppColors.kpurpleOff.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                  isSameDay(taskModel.taskModel.date,
                                          DateTime.now())
                                      ? "Today"
                                      : "${taskModel.taskModel.date.month}/${taskModel.taskModel.date.day}/${taskModel.taskModel.date.year}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: context.fontSize / 1.2,
                                      color: AppColors.kLightPurple)),
                            ),
                          ),
                        ]),
                  ),
                )));
      },
    );
  }
}

class EditTaskCategoryTile extends StatelessWidget {
  const EditTaskCategoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {
              context.showDialogMessage(const SelectCategoryDialog());
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 79, 79, 79), width: 0.3))),
              height: context.height * 0.085,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.01),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.category_outlined,
                          size: context.height * 0.049 / 1.45,
                          color: const Color.fromARGB(255, 225, 23, 90),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Task",
                        style: TextStyle(
                            color: AppColors.kLightPurple,
                            fontSize: context.fontSize * 0.8,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: context.width * 0.02,
                      ),
                      Container(
                        height: context.height * 0.045,
                        width: context.height * 0.045,
                        decoration: BoxDecoration(
                            color: AppColors.kLightPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.access_time),
                      ),
                    ]),
              ),
            )));
  }
}
