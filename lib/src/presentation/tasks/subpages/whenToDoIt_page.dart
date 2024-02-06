import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/new_task_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/settPriorityTextFeild_cubit.dart';
import 'package:habit_now/src/presentation/tasks/subpages/newTask_page.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class WhenToDoItPage extends StatelessWidget {
  const WhenToDoItPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.height * 0.08),
                Text(
                  "Define your task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kpurpleOn,
                    fontSize: context.fontSize * 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.05),
                const RecurringTaskStartDateTile(),
                const RecurringTaskEndtDateTile(),
                const NewTaskTimeTile(),
                const RecurringTaskPriorityTile()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: double.infinity,
                height: context.height * 0.08,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 0.3)),
                    color: AppColors.kBackgroundColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width / 10,
                    ),
                    Material(
                      color: AppColors.kBackgroundColor,
                      child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: context.height * 0.008),
                          height: context.height * 0.04,
                          width: context.width / 5,
                          child: Text(
                            "BACK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.fontSize),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width / 10 * 1.4,
                    ),
                    SizedBox(
                      width: context.width / 10 * 1.4,
                    ),
                    Material(
                      color: AppColors.kBackgroundColor,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: context.height * 0.008),
                          height: context.height * 0.04,
                          width: context.width / 5,
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: AppColors.kLightPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: context.fontSize),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      //
    );
  }
}

class RecurringTaskStartDateTile extends StatelessWidget {
  const RecurringTaskStartDateTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () async {
              context
                  .read<NewTaskCubit>()
                  .updateProperty(date: await context.showDatePickerDialog());
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
                            "Start date",
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
                          child: Text("Toady",
                              // isSameDay(taskModel.taskModel.date,
                              //         DateTime.now())
                              //     ? "Today"
                              //     : "${taskModel.taskModel.date.month}/${taskModel.taskModel.date.day}/${taskModel.taskModel.date.year}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: context.fontSize / 1.2,
                                  color: AppColors.kLightPurple)),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

class RecurringTaskEndtDateTile extends StatelessWidget {
  const RecurringTaskEndtDateTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () async {
              context
                  .read<NewTaskCubit>()
                  .updateProperty(date: await context.showDatePickerDialog());
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
                            "End date",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          )
                        ],
                      ),
                      const Spacer(),
                      Switch(
                          // bolean stuff
                          thumbColor: const MaterialStatePropertyAll(
                              AppColors.kLightPurple),
                          trackColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 197, 5, 69)),
                          value: true,
                          onChanged: (_) {})
                    ]),
              ),
            )));
  }
}

class RecurringTaskPriorityTile extends StatelessWidget {
  const RecurringTaskPriorityTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: () {
              context.showDialogMessage(const RecurringTaskPriorityDialog());
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
                            // TODO: Implement the shit stuff
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

class RecurringTaskPriorityDialog extends StatelessWidget {
  const RecurringTaskPriorityDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textFieldCubit = context.read<TextFieldCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      textFieldCubit.initializeTextField();
      textFieldCubit.controller.text = ""; //TODO: Here add Ur stuff
    });

    return BlocBuilder<NewTaskCubit, NewTaskState>(
      builder: (context, taskModel) {
        return Dialog(
          elevation: 0,
          backgroundColor: AppColors.kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 18),
                Text(
                  'Set a priority',
                  style: TextStyle(
                      fontSize: context.fontSize * 0.85,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.width * 0.08),
                  height: context.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.fontSize * 0.7)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Material(
                            color: const Color.fromARGB(255, 31, 31, 31),
                            borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(context.width * 0.025),
                                topLeft:
                                    Radius.circular(context.width * 0.025)),
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(context.width * 0.025),
                                  topLeft:
                                      Radius.circular(context.width * 0.025)),
                              onTap: () {
                                textFieldCubit.decrement();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 54, 54, 54)),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          context.width * 0.025),
                                      topLeft: Radius.circular(
                                          context.width * 0.025)),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                )),
                              ),
                            )),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 31, 31, 31)),
                            child: TextField(
                              autocorrect: true,
                              cursorColor: AppColors.kLightPurple,
                              autofocus: true,
                              focusNode: textFieldCubit.focusNode,
                              controller: textFieldCubit.controller,
                              style: TextStyle(
                                  fontSize: context.fontSize * 1.2,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 54, 54, 54))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 54, 54, 54))),
                                  border: OutlineInputBorder(),
                                  isDense: false),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Material(
                            color: const Color.fromARGB(255, 31, 31, 31),
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(context.width * 0.025),
                                topRight:
                                    Radius.circular(context.width * 0.025)),
                            child: InkWell(
                              onTap: () {
                                textFieldCubit.increment();
                              },
                              borderRadius: BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(context.width * 0.025),
                                  topRight:
                                      Radius.circular(context.width * 0.025)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                          context.width * 0.025),
                                      topRight: Radius.circular(
                                          context.width * 0.025)),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 54, 54, 54)),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                )),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.height * 0.005, left: context.width * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reminder schedule',
                      style: TextStyle(
                          fontSize: context.fontSize * 0.8,
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                BlocBuilder<NewTaskCubit, NewTaskState>(
                  builder: (context, taskModel) {
                    return Padding(
                      padding: EdgeInsets.only(left: context.width * 0.03),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Row(
                            children: [
                              Radio(
                                  value: ReminderSchedule.alwaysEnabled,
                                  groupValue:
                                      taskModel.taskModel.reminder.schedule,
                                  onChanged: (newText) {
                                    context.read<NewTaskCubit>().updateProperty(
                                        reminder: taskModel.taskModel.reminder
                                            .copyWith(
                                                schedule: ReminderSchedule
                                                    .alwaysEnabled));
                                  }),
                              Text(
                                "Always enabled",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.fontSize / 1.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: ReminderSchedule.specifcDaysOfTheWeek,
                                  groupValue:
                                      taskModel.taskModel.reminder.schedule,
                                  onChanged: (newText) {
                                    context.read<NewTaskCubit>().updateProperty(
                                        reminder: taskModel.taskModel.reminder
                                            .copyWith(
                                                schedule: ReminderSchedule
                                                    .specifcDaysOfTheWeek));
                                  }),
                              Text(
                                "Specific days of the week",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.fontSize / 1.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: ReminderSchedule.daysBefore,
                                  groupValue:
                                      taskModel.taskModel.reminder.schedule,
                                  onChanged: (newText) {
                                    context.read<NewTaskCubit>().updateProperty(
                                        reminder: taskModel.taskModel.reminder
                                            .copyWith(
                                                schedule: ReminderSchedule
                                                    .daysBefore));
                                  }),
                              Text(
                                "Days before",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.fontSize / 1.2),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<NewTaskCubit>().updateProperty(
                              reminder: ReminderModel(
                                  time: DateTime.now(),
                                  type: ReminderTime.dontRemind,
                                  schedule: ReminderSchedule.alwaysEnabled));

                          context.pop();
                        },
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16)),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16)),
                            border: Border(
                                right: BorderSide(
                                    color: Color.fromARGB(255, 84, 84, 84),
                                    width: 0.1),
                                top: BorderSide(
                                    color: Color.fromARGB(255, 84, 84, 84),
                                    width: 0.2)),
                          ),
                          width: context.width * 0.398,
                          height: context.height * 0.056,
                          child: const Center(
                              child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16)),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color.fromARGB(255, 84, 84, 84),
                                    width: 0.1),
                                top: BorderSide(
                                    color: Color.fromARGB(255, 84, 84, 84),
                                    width: 0.2)),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16)),
                          ),
                          width: context.width * 0.398,
                          height: context.height * 0.056,
                          child: const Center(
                              child: Text(
                            "CONFIRM",
                            style: TextStyle(
                                color: AppColors.kLightPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
