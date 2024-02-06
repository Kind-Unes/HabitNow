import 'package:flutter/material.dart';
import 'package:habit_now/src/presentation/shared/dialogMessages.dart';
import 'package:habit_now/src/presentation/tasks/subpages/newCategory_page.dart';
import 'package:habit_now/src/presentation/timer/components/timer_widgets.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class NewCategoryBottomSheetTile extends StatelessWidget {
  const NewCategoryBottomSheetTile({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  final IconData icon;
  final String title;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
            onTap: function,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 62, 62, 62), width: 0.5))),
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                  horizontal: context.height * 0.015),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * 0.01,
                    ),
                    Icon(
                      icon,
                      color: const Color.fromARGB(255, 66, 66, 66),
                      size: context.height * 0.04,
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: context.fontSize * 0.91,
                      ),
                    ),
                  ]),
            )));
  }
}

class NewCategoryBottomSheetFirstTile extends StatelessWidget {
  const NewCategoryBottomSheetFirstTile({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: context.height * 0.02, horizontal: context.height * 0.015),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: context.height * 0.015,
              width: context.height * 0.015,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.kLightPurple),
            ),
            SizedBox(
              width: context.width * 0.032,
            ),
            Text(
              category.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: context.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              height: context.height * 0.06,
              width: context.height * 0.06,
              decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: BorderRadius.circular(context.height * 0.015)),
              child: Icon(
                Icons.category,
                size: context.fontSize * 1.5,
              ),
            ),
          ]),
    );
  }
}

class TimerBottomSheetContent extends StatelessWidget {
  const TimerBottomSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
                color: AppColors.kpurpleOn,
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "Select an activity",
                  style: TextStyle(color: AppColors.kMeduimGray, fontSize: 15),
                )
              ],
            ),
            const Spacer(),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 32,
                color: AppColors.kpurpleOff, // implement the off on logic here
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        const Divider(
          color: AppColors.kGray,
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              HabitTile(
                icon: Icons.attach_money,
                text: 'Habit 1',
                color: Color.fromARGB(255, 4, 160, 36),
              ),
              HabitTile(
                icon: Icons.clear,
                text: 'Habit 2',
                color: Color.fromARGB(255, 160, 69, 4),
              ),
              HabitTile(
                icon: Icons.sports,
                text: 'Practise',
                color: Color.fromARGB(255, 4, 12, 160),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NewCategoryBottomSheet extends StatelessWidget {
  const NewCategoryBottomSheet({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NewCategoryBottomSheetFirstTile(category: category),
        NewCategoryBottomSheetTile(
          icon: Icons.mode_edit_outline_outlined,
          title: 'Category name',
          function: () {
            context.showDialogMessage(const TextDialog(
              label: 'Category',
            ));
          },
        ),
        NewCategoryBottomSheetTile(
          icon: Icons.image_outlined,
          title: 'Category icon',
          function: () {
            context.showDialogMessage(const NewCategoryIconDialog());
          },
        ),
        NewCategoryBottomSheetTile(
          icon: Icons.invert_colors_outlined,
          title: 'Category color',
          function: () {
            context.showDialogMessage(const NewCategoryColorDialog());
// CategoryColorButton
          },
        ),
        NewCategoryBottomSheetTile(
          icon: Icons.mode_edit_outline_outlined,
          title: 'Delete category',
          function: () {
            context.showDialogMessage(DeleteCategoryDialog(
              yesFunction: () {},
              noFunction: () {},
            ));
          },
        ),
      ],
    );
  }
}

class FloatingActionButtonBottomSheet extends StatelessWidget {
  const FloatingActionButtonBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      width: double.infinity,
      child: Column(children: [
        FirstFloatingABBottomSheetTile(
          title: "Habit",
          subTitle:
              "Activity that repeats ov er time.It has detailed tracking and statistics.",
          icon: Icons.emoji_events_outlined,
          function: () {},
        ),
        FloatingABBottomSheetTile(
            function: () {
              context.pushNamed("/recurring_task/select_category");
            },
            title: "Recurring Task",
            subTitle:
                "Activty that repeats over time without tracking or statistics.",
            icon: Icons.repeat),
        FloatingABBottomSheetTile(
            function: () {
              context.pushNamed("/new_task");
            },
            title: "Task",
            subTitle: "Single instatnce activity withiut tracking over time.",
            icon: Icons.repeat)
      ]),
    );
  }
}

class FloatingABBottomSheetTile extends StatelessWidget {
  const FloatingABBottomSheetTile({
    super.key,
    required this.function,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final Function() function;
  final String title;
  final String subTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
            color: AppColors.kBackgroundColor,
            child: InkWell(
                onTap: function,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.height * 0.015),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: context.height * 0.049,
                            width: context.height * 0.049,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 67, 23, 38)),
                            child: Center(
                              child: Icon(
                                icon,
                                size: context.height * 0.049 / 1.35,
                                color: const Color.fromARGB(255, 225, 23, 90),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: context.height * 0.005,
                              ),
                              SizedBox(
                                width: context.width * 0.7,
                                child: Text(
                                  subTitle,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Color.fromARGB(255, 108, 108, 108),
                            size: 30,
                          ),
                        ]),
                  ),
                ))));
  }
}

class FirstFloatingABBottomSheetTile extends StatelessWidget {
  const FirstFloatingABBottomSheetTile({
    super.key,
    required this.function,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final Function() function;
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
            color: AppColors.kBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: InkWell(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                onTap: function,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.height * 0.015),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: context.height * 0.049,
                            width: context.height * 0.049,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 67, 23, 38)),
                            child: Center(
                              child: Icon(
                                icon,
                                size: context.height * 0.049 / 1.35,
                                color: const Color.fromARGB(255, 225, 23, 90),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: context.height * 0.005,
                              ),
                              SizedBox(
                                width: context.width * 0.7,
                                child: Text(
                                  subTitle,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: Color.fromARGB(255, 108, 108, 108),
                            size: 30,
                          ),
                        ]),
                  ),
                ))));
  }
}
