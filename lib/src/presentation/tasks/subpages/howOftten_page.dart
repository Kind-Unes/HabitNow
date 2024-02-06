import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/new_task_cubit.dart';
import 'package:habit_now/src/presentation/tasks/subpages/selectCategory_page.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class HowOftenPage extends StatelessWidget {
  const HowOftenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.height * 0.08),
                Center(
                  child: Text(
                    "How often do  you want to do it?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kpurpleOn,
                      fontSize: context.fontSize * 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.05),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.016),
                  child: Column(children: [
                    Row(
                      children: [
                        Radio(
                            value: "taskModel.taskModel.reminder.schedule",
                            groupValue: "taskModel.taskModel.reminder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "Every day",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "taskModel.taskModel.reminder.schedule",
                            groupValue:
                                "taskModel.taskModel.remisnder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "specific days of the week",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "taskModel.taskModel.reminder.schedule",
                            groupValue:
                                "taskModel.taskModsel.reminder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "specific days of the month",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "taskModel.taskModel.reminder.schedule",
                            groupValue:
                                "taskModel.taskMsodel.reminder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "specific days of the year",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: ReminderSchedule.daysBefore,
                            groupValue: "taskModel.taskModel.reminder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "Some days per period",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: ReminderSchedule.specifcDaysOfTheWeek,
                            groupValue: "taskModel.taskModel.reminder.schedule",
                            onChanged: (newText) {}),
                        Text(
                          "Repeat",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: context.fontSize / 1),
                        ),
                      ],
                    ),
                  ]),
                ),
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
                                fontWeight: FontWeight.w500,
                                fontSize: context.fontSize),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width / 10 * 1.4,
                    ),
                    const Row(
                      children: [
                        ProgressBullet(
                          isSelected: true,
                        ),
                        ProgressBullet(
                          isSelected: true,
                        ),
                        ProgressBullet(
                          isSelected: true,
                        ),
                        ProgressBullet(
                          isSelected: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.width / 10 * 1.4,
                    ),
                    Material(
                      color: AppColors.kBackgroundColor,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed("/recurring_task/when_todoit");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: context.height * 0.008),
                          height: context.height * 0.04,
                          width: context.width / 5,
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: AppColors.kLightPurple,
                                fontWeight: FontWeight.w500,
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
