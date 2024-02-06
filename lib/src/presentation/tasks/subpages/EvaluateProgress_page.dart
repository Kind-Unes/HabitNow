import 'package:flutter/material.dart';
import 'package:habit_now/src/presentation/tasks/subpages/selectCategory_page.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class EvaluateProgressPage extends StatelessWidget {
  const EvaluateProgressPage({super.key});

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
                  "How do you want to evaluate your progress?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kpurpleOn,
                    fontSize: context.fontSize * 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.029),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Material(
                    borderRadius: BorderRadius.circular(context.fontSize * 1.1),
                    color: AppColors.kLightPurple,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed("/recurring_task/define_task");
                      },
                      borderRadius:
                          BorderRadius.circular(context.fontSize * 1.1),
                      child: Container(
                        height: context.height * 0.075,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(context.fontSize * 1.1)),
                        child: Center(
                            child: Text(
                          "WITH A YES OR NO",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: context.fontSize,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.005),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.01),
                  child: Text(
                    "if you just want to record whether you succeed with the activity or not",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 138, 138, 138),
                      fontSize: context.fontSize * 0.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.05 / 1.3),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Material(
                    borderRadius: BorderRadius.circular(context.fontSize * 1.1),
                    color: const Color.fromARGB(126, 255, 6, 89),
                    child: InkWell(
                      //onTap: () {}, // Premuim
                      borderRadius:
                          BorderRadius.circular(context.fontSize * 1.1),
                      child: Container(
                        height: context.height * 0.075,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(context.fontSize * 1.1)),
                        child: Center(
                            child: Text(
                          "WITH A CHECKLIST",
                          style: TextStyle(
                              color: const Color.fromARGB(88, 255, 255, 255),
                              fontSize: context.fontSize,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.005),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.01),
                  child: Text(
                    "if you just want to evaluate your avtivity based on aset of sub-items",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 138, 138, 138),
                      fontSize: context.fontSize * 0.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.005 * 2.5),
                Center(
                    child: Text(
                  "Premuim feature",
                  style: TextStyle(
                    color: AppColors.kLightPurple,
                    fontSize: context.fontSize / 1.3,
                  ),
                )),
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
                    const Row(
                      children: [
                        ProgressBullet(
                          isSelected: true,
                        ),
                        ProgressBullet(
                          isSelected: false,
                        ),
                        ProgressBullet(
                          isSelected: false,
                        ),
                        ProgressBullet(
                          isSelected: false,
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
      //
    );
  }
}
