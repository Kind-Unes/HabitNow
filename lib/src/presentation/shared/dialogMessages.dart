import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/TextControllers_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/addCategory_cubi.dart';
import 'package:habit_now/src/cubit/tasks_cubits/categories_database_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/editCategory_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/new_task_cubit.dart';
import 'package:habit_now/src/presentation/tasks/subpages/newCategory_page.dart';
import 'package:habit_now/src/utils/app_static_data.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: SizedBox(
        height: context.height * 0.11,
        width: context.height * 0.11,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                height: context.height * 0.055,
                width: context.height * 0.055,
                decoration: BoxDecoration(
                    color: categoryModel.color,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(categoryModel.icon),
              ),
              SizedBox(
                height: context.height * 0.04,
                child: Text(
                  categoryModel.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: context.fontSize * 0.72),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DialogExpandedButton extends StatelessWidget {
  const DialogExpandedButton({
    super.key,
    required this.border,
    required this.color,
    required this.content,
    required this.function,
  });
  final List<int> border;
  final Color color;
  final Widget content;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: color,
        child: InkWell(
            onTap: function,
            child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 0.4,
                      color: border[0] != 0
                          ? const Color.fromARGB(255, 35, 35, 35)
                          : Colors.transparent,
                    ),
                    top: BorderSide(
                      color: border[1] != 0
                          ? const Color.fromARGB(255, 35, 35, 35)
                          : Colors.transparent,
                    ),
                    right: BorderSide(
                      width: 0.4,
                      color: border[2] != 0
                          ? const Color.fromARGB(255, 35, 35, 35)
                          : Colors.transparent,
                    ),
                    bottom: BorderSide(
                      color: border[3] != 0
                          ? const Color.fromARGB(255, 35, 35, 35)
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: content)),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.function,
  });
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
          onTap: function,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 35, 35, 35),
                ),
                bottom: BorderSide(
                  color: Color.fromARGB(255, 35, 35, 35),
                ),
                right: BorderSide(
                  width: 0.4,
                  color: Color.fromARGB(255, 35, 35, 35),
                ),
              ),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: context.height * 0.035,
                      width: context.height * 0.035,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: const Color.fromARGB(255, 46, 46, 46)),
                      child: Icon(
                        Icons.check,
                        size: context.height * 0.027,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7)),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class NewTaskSelectCategoryDialog extends StatelessWidget {
  const NewTaskSelectCategoryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 18.0),
            Text(
              'Select a category',
              style: TextStyle(
                  fontSize: context.fontSize * 0.85,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Color.fromARGB(255, 46, 46, 46),
            ),
            SizedBox(
              height: context.height * 0.37,
              child: SingleChildScrollView(
                child: BlocBuilder<CategoriesDatabaseCubit, List>(
                  builder: (context, customCategoiresList) {
                    return Wrap(
                      children: [
                        ...categories
                            .map((e) => CategoryButton(categoryModel: e))
                            .toList(),
                        ...customCategoiresList
                            .map((e) => CategoryButton(categoryModel: e))
                            .toList(),
                      ],
                    );
                  },
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context.pushNamed("/new_category");
                },
                child: Container(
                  height: context.height * 0.07,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 79, 79, 79),
                              width: 0.3))),
                  child: Center(
                    child: Text(
                      "MANAGE CATEGORIES",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: context.fontSize * 00.85),
                    ),
                  ),
                )),
            InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: context.height * 0.07,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 79, 79, 79),
                              width: 0.3))),
                  child: Center(
                    child: Text(
                      "CLOSE",
                      style: TextStyle(
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: context.fontSize * 00.85),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class TimeAndRemindersDialog extends StatelessWidget {
  const TimeAndRemindersDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          Text(
            'Time and reminders',
            style: TextStyle(
                fontSize: context.fontSize * 0.85,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          Column(
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              Icon(Icons.notification_add_rounded,
                  color: Colors.amber, size: context.fontSize * 3),
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                'No reminders for this activity',
                style: TextStyle(
                    fontSize: context.fontSize * 0.85,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
            ],
          ),
          InkWell(
              onTap: () {
                context.showDialogMessage(const NewReminderDialog());
              },
              child: Container(
                height: context.height * 0.07,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 79, 79, 79),
                            width: 0.3))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline_sharp,
                        color: AppColors.kLightPurple,
                      ),
                      SizedBox(width: context.width * 0.017),
                      Text(
                        "NEW REMINDER",
                        style: TextStyle(
                            color: AppColors.kLightPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: context.fontSize * 00.8),
                      ),
                    ],
                  ),
                ),
              )),
          InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: context.height * 0.07,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 79, 79, 79),
                            width: 0.3))),
                child: Center(
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.fontSize * 00.85),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class TextDialog extends StatelessWidget {
  const TextDialog({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.fontSize * 1,
                left: context.fontSize * 1,
                right: context.fontSize * 1,
                bottom: context.fontSize * 0.5),
            child: BlocBuilder<NewTaskCubit, NewTaskState>(
              builder: (mycontext, state) {
                return TextField(
                  onChanged: (newText) {
                    mycontext
                        .read<NewTaskCubit>()
                        .updateProperty(note: newText);
                  },
                  maxLines: 5,
                  minLines: 3,
                  style: TextStyle(fontSize: context.fontSize * 1.1),
                  autofocus: true,
                  autocorrect: true,
                  cursorColor: AppColors.kLightPurple,
                  cursorHeight: context.height * 0.03,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: label,
                    labelStyle: TextStyle(
                        fontSize: context.fontSize,
                        color: AppColors.kLightPurple),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.kLightPurple, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.kLightPurple, width: 2.0),
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
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "OK",
                      style: TextStyle(
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// TODO: Generlize it OR Recreate other one + renames
class DeleteVerificationDialog extends StatelessWidget {
  const DeleteVerificationDialog({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.fontSize * 1,
                left: context.fontSize * 1,
                right: context.fontSize * 1,
                bottom: context.fontSize * 0.5),
            child: Center(
                child: Text(
              "Delete category",
              style: TextStyle(color: Colors.red, fontSize: context.fontSize),
            )),
          ),
          const Divider(
            color: Color.fromARGB(255, 66, 66, 66),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context
                        .read<CategoriesDatabaseCubit>()
                        .deleteCategory(category);
                    //first for the dialogMessage
                    context.pop();
                    //second for the bottomSheet
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "OK",
                      style: TextStyle(
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NewCategoryTextDialog extends StatelessWidget {
  const NewCategoryTextDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController(
        text: context.read<NewCategoryCubit>().state.categoryModel.name);

    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: context.fontSize * 1,
                  left: context.fontSize * 1,
                  right: context.fontSize * 1,
                  bottom: context.fontSize * 0.5),
              child: TextField(
                onChanged: (newText) {
                  context
                      .read<NewCategoryCubit>()
                      .updateProperty(name: newText);
                },
                maxLines: 5,
                minLines: 3,
                controller: textEditingController,
                style: TextStyle(fontSize: context.fontSize * 1.1),
                autofocus: true,
                autocorrect: true,
                cursorColor: AppColors.kLightPurple,
                cursorHeight: context.height * 0.03,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Category",
                  labelStyle: TextStyle(
                      fontSize: context.fontSize,
                      color: AppColors.kLightPurple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.kLightPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.kLightPurple, width: 2.0),
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
              )),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(16)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(16)),
                    ),
                    width: context.width * 0.398,
                    height: context.height * 0.056,
                    child: const Center(
                        child: Text(
                      "OK",
                      style: TextStyle(
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EditCategoryTextDialog extends StatelessWidget {
  const EditCategoryTextDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingControllerCubit textEditingControllerCubit =
        context.read<TextEditingControllerCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      textEditingControllerCubit.updateController(TextEditingController(
          text: context.read<EditCategoryCubit>().state.categoryModel.name));
    });

    return BlocBuilder<TextEditingControllerCubit, TextEditingControllerState>(
      builder: (context, state) {
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
                Padding(
                    padding: EdgeInsets.only(
                        top: context.fontSize * 1,
                        left: context.fontSize * 1,
                        right: context.fontSize * 1,
                        bottom: context.fontSize * 0.5),
                    child: TextField(
                      onChanged: (newText) {
                        // changing this shit with a variable
                        context
                            .read<EditCategoryCubit>()
                            .updateProperty(name: newText);

                        context.refreshDB();
                      },
                      maxLines: 5,
                      minLines: 3,
                      controller: state.textEditingController,
                      style: TextStyle(fontSize: context.fontSize * 1.1),
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: AppColors.kLightPurple,
                      cursorHeight: context.height * 0.03,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "name",
                        labelStyle: TextStyle(
                            fontSize: context.fontSize,
                            color: AppColors.kLightPurple),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.kLightPurple, width: 2.0),
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
                    )),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16)),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16)),
                          ),
                          width: context.width * 0.398,
                          height: context.height * 0.056,
                          child: const Center(
                              child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // reinitialize text controllers
                          context.pop();
                        },
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16)),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16)),
                          ),
                          width: context.width * 0.398,
                          height: context.height * 0.056,
                          child: const Center(
                              child: Text(
                            "OK",
                            style: TextStyle(
                                color: AppColors.kLightPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
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

class NewReminderDialog extends StatelessWidget {
  const NewReminderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  'New reminder',
                  style: TextStyle(
                      fontSize: context.fontSize * 0.85,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                InkWell(
                  onTap: () async {
                    //! HERE YOU COMPLETE THE RTST OF THE REMINDER BULL SHIT
                    context.showDialogMessage(Dialog(
                      elevation: 0,
                      backgroundColor: AppColors.kBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<NewTaskCubit, NewTaskState>(
                            builder: (mycontext, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: context.height * 0.4,
                                    width: context.width * 0.3,
                                    child: TextField(
                                      onChanged: (newText) {
                                        mycontext
                                            .read<NewTaskCubit>()
                                            .updateProperty(note: newText);
                                      },
                                      style: TextStyle(
                                          fontSize: context.fontSize * 1.1),
                                      autofocus: true,
                                      autocorrect: true,
                                      cursorColor: AppColors.kLightPurple,
                                      cursorHeight: context.height * 0.03,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: TextStyle(
                                            fontSize: context.fontSize,
                                            color: AppColors.kLightPurple),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.kLightPurple,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.kLightPurple,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.kLightPurple,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.kLightPurple,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.pop();
                                  },
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16)),
                                    ),
                                    width: context.width * 0.398,
                                    height: context.height * 0.056,
                                    child: const Center(
                                        child: Text(
                                      "CANCEL",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
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
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(16)),
                                    ),
                                    width: context.width * 0.398,
                                    height: context.height * 0.056,
                                    child: const Center(
                                        child: Text(
                                      "OK",
                                      style: TextStyle(
                                          color: AppColors.kLightPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0),
                      BlocBuilder<NewTaskCubit, NewTaskState>(
                        builder: (context, taskModel) {
                          return Text(
                            "${taskModel.taskModel.reminder.time.hour} : ${taskModel.taskModel.reminder.time.minute}",
                            style: TextStyle(
                                fontSize: context.fontSize * 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Text(
                        'Reminder time',
                        style: TextStyle(
                            fontSize: context.fontSize * 0.8,
                            color: AppColors.kLightPurple,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                Padding(
                  padding: EdgeInsets.only(left: context.width * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reminder time',
                      style: TextStyle(
                          fontSize: context.fontSize * 0.8,
                          color: AppColors.kLightPurple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.width * 0.03),
                  height: context.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.kGray,
                      borderRadius:
                          BorderRadius.circular(context.fontSize * 0.7)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Material(
                          color: taskModel.taskModel.reminder.type ==
                                  ReminderTime.dontRemind
                              ? const Color.fromARGB(255, 103, 32, 55)
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(context.fontSize * 0.7),
                              bottomLeft:
                                  Radius.circular(context.fontSize * 0.7)),
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(context.fontSize * 0.7),
                                bottomLeft:
                                    Radius.circular(context.fontSize * 0.7)),
                            onTap: () {
                              context.read<NewTaskCubit>().updateProperty(
                                  reminder: taskModel.taskModel.reminder
                                      .copyWith(type: ReminderTime.dontRemind));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.notifications_off_outlined,
                                    color: taskModel.taskModel.reminder.type ==
                                            ReminderTime.dontRemind
                                        ? const Color.fromARGB(255, 255, 0, 81)
                                        : Colors.grey,
                                    size: context.fontSize * 1.3),
                                Text(
                                  "Don't remind",
                                  style: TextStyle(
                                      color:
                                          taskModel.taskModel.reminder.type ==
                                                  ReminderTime.dontRemind
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 81)
                                              : Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )),
                        Expanded(
                            child: Material(
                          color: taskModel.taskModel.reminder.type ==
                                  ReminderTime.notifications
                              ? const Color.fromARGB(255, 103, 32, 55)
                              : Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.read<NewTaskCubit>().updateProperty(
                                  reminder: taskModel.taskModel.reminder
                                      .copyWith(
                                          type: ReminderTime.notifications));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.notifications_none_outlined,
                                    color: taskModel.taskModel.reminder.type ==
                                            ReminderTime.notifications
                                        ? const Color.fromARGB(255, 255, 0, 81)
                                        : Colors.grey,
                                    size: context.fontSize * 1.3),
                                Text(
                                  "Notification",
                                  style: TextStyle(
                                      color:
                                          taskModel.taskModel.reminder.type ==
                                                  ReminderTime.notifications
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 81)
                                              : Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )),
                        Expanded(
                            child: Material(
                          color: taskModel.taskModel.reminder.type ==
                                  ReminderTime.alarm
                              ? const Color.fromARGB(255, 103, 32, 55)
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomRight:
                                  Radius.circular(context.fontSize * 0.7),
                              topRight:
                                  Radius.circular(context.fontSize * 0.7)),
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(context.fontSize * 0.7),
                                topRight:
                                    Radius.circular(context.fontSize * 0.7)),
                            onTap: () {
                              context.read<NewTaskCubit>().updateProperty(
                                  reminder: taskModel.taskModel.reminder
                                      .copyWith(type: ReminderTime.alarm));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.alarm,
                                    color: taskModel.taskModel.reminder.type ==
                                            ReminderTime.alarm
                                        ? const Color.fromARGB(255, 255, 0, 81)
                                        : Colors.grey,
                                    size: context.fontSize * 1.3),
                                Text(
                                  "Alarm",
                                  style: TextStyle(
                                      color:
                                          taskModel.taskModel.reminder.type ==
                                                  ReminderTime.alarm
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 81)
                                              : Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ]),
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

class NewCategoryColorDialog extends StatelessWidget {
  const NewCategoryColorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 18.0),
            Text(
              'Category color',
              style: TextStyle(
                  fontSize: context.fontSize * 0.85,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Color.fromARGB(255, 46, 46, 46),
            ),
            SizedBox(
              height: context.height * 0.37,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05),
                      child: Wrap(
                          children: customCategoriesColors
                              .map((e) => NewCategoryColorButton(color: e))
                              .toList())),
                ]),
              ),
            ),
            InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: context.height * 0.07,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 79, 79, 79),
                              width: 0.3))),
                  child: Center(
                    child: Text(
                      "CLOSE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: context.fontSize * 00.85),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class EditCategoryColorDialog extends StatelessWidget {
  const EditCategoryColorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          Text(
            'Category color',
            style: TextStyle(
                fontSize: context.fontSize * 0.85,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          SizedBox(
            height: context.height * 0.37,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Wrap(
                        children: customCategoriesColors
                            .map((e) => EditCategoryColorButton(color: e))
                            .toList())),
              ]),
            ),
          ),
          InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: context.height * 0.07,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 79, 79, 79),
                            width: 0.3))),
                child: Center(
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.fontSize * 00.85),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
