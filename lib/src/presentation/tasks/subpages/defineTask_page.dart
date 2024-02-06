import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/DefineTaskFocusNode_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/DefineTaskTextController_cubit.dart';
import 'package:habit_now/src/presentation/tasks/subpages/selectCategory_page.dart';
import 'package:habit_now/src/presentation/timer/components/timer_widgets.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class DefineTaskPage extends StatelessWidget {
  const DefineTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingFeildController =
        context.read<DefineTaskTextEditingControllerCubit>().myController;
    final FocusNode firstFocusNode =
        context.read<DefineTaskFocusNodeCubit>().focusNode;

    final FocusNode secondFocusNode =
        context.read<DefineSecondTaskFocusNodeCubit>().focusNode;

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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.height * 0.01),
                  child: SizedBox(
                    height: context.height * 0.065,
                    child: TextField(
                      onChanged: (newText) {},
                      controller: textEditingFeildController,
                      focusNode: firstFocusNode,
                      // ADDED STUFF
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        firstFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(secondFocusNode);
                      },
                      style: TextStyle(fontSize: context.fontSize * 1.1),
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: AppColors.kLightPurple,
                      cursorHeight: context.height * 0.03,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.kLightPurple),
                        isDense: true,
                        labelText: 'Task',
                        labelStyle: TextStyle(
                          fontSize: context.fontSize,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 112, 112, 112),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.005 * 4),
                Center(
                    child: Text(
                  "e.g., Work on the project.",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 92, 92, 92),
                    fontSize: context.fontSize / 1.2,
                  ),
                )),
                SizedBox(height: context.height * 0.005 * 4),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.height * 0.01),
                  child: SizedBox(
                    height: context.height * 0.065,
                    child: TextField(
                      focusNode: secondFocusNode,
                      textInputAction: TextInputAction.done,
                      onChanged: (newText) {},
                      style: TextStyle(fontSize: context.fontSize * 1.1),
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: AppColors.kLightPurple,
                      cursorHeight: context.height * 0.03,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.kLightPurple),
                        isDense: true,
                        labelText: 'Note (optional)',
                        labelStyle: TextStyle(
                          fontSize: context.fontSize,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 112, 112, 112),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
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
                          isSelected: true,
                        ),
                        ProgressBullet(
                          isSelected: false,
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
                          if (textEditingFeildController.text.isNotEmpty) {
                            context.pushNamed("/recurring_task/how_often");
                          } else {
                            context.showToast(const ToastWidget(
                              text: "Enter a name",
                            ));
                          }
                        },
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
