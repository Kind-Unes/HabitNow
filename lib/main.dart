import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/main/bottomNavBar_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/TextControllers_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/addCategory_cubi.dart';
import 'package:habit_now/src/cubit/tasks_cubits/categories_database_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/tasks_database_cubit.dart.dart';
import 'package:habit_now/src/cubit/tasks_cubits/editCategory_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/new_task_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/settPriorityTextFeild_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/actionButton_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/dialog_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_controller_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_record_cubt.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_cubit.dart';
import 'package:habit_now/src/cubit/today/todayListView_cubit.dart';
import 'package:habit_now/src/presentation/shared/main.dart';
import 'package:habit_now/src/presentation/tasks/subpages/EvaluateProgress_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/defineTask_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/editTask_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/howOftten_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/newCategory_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/newTask_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/selectCategory_page.dart';
import 'package:habit_now/src/presentation/tasks/subpages/whenToDoIt_page.dart';
import 'package:habit_now/src/presentation/timer/timer.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/models/task_model.dart';
import 'package:habit_now/src/utils/theme.dart';
import 'package:hive_flutter/adapters.dart';

//! 0.0235 == 20 px;
// Shared hive adapters

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ReminderModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(IconDataAdapter());
  // Hive.registerAdapter(ReccurringTaskModelAdapter());
  // Hive.registerAdapter(WhenToDoITAdapter());
  // Hive.registerAdapter(HowToDoItAdapter());
  // Hive.registerAdapter(ReapeatAdapter());
  // Hive.registerAdapter(NotAlternateDaysAdapter());
  // Hive.registerAdapter(AlternateDaysAdapter());
  // Hive.registerAdapter(SomeDaysPerPeriodAdapter());
  // Hive.registerAdapter(SpecificDaysOfTheYearAdapter());
  // Hive.registerAdapter(UseDaysOfTheWeekYearAdapter());
  // Hive.registerAdapter(SpecificDaysOfTheMonthAdapter());
  // Hive.registerAdapter(UseDaysOfTheWeekMonthAdapter());
  // Hive.registerAdapter(SpecifcDaysOfTheWeekAdapter());

  await Hive.initFlutter();
  tasksBox = await Hive.openBox<TaskModel>('1');
  customCategoriesBox = await Hive.openBox<CategoryModel>("2");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VibrateActionButtonCubit()),
          BlocProvider(create: (context) => VolumeActionButtonCubit()),
          BlocProvider(create: (context) => TimerCubit()),
          BlocProvider(
              create: (context) => TimerPageViewCubit.TimerIndexCubit()),
          BlocProvider(create: (context) => DialogCubit()),
          BlocProvider(create: (context) => TimerRecordCubit()),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => TodayListViewCubit()),
          BlocProvider(create: (context) => FocusNodeCubit()),
          BlocProvider(create: (context) => TextFieldCubit()),
          BlocProvider(create: (context) => TasksDatabaseCubit()),
          BlocProvider(
            create: (context) => NewTaskCubit(),
          ),
          BlocProvider(
            create: (context) => StopwatchCubit(),
          ),
          BlocProvider(
            create: (context) => TextEditingControllerCubit(),
          ),
          BlocProvider(
            create: (context) => SecondFocusNodeCubit(),
          ),
          BlocProvider(
            create: (context) => FocusNodeCubit(),
          ),
          BlocProvider(
            create: (context) => EditTaskControllerCubit(),
          ),
          BlocProvider(
            create: (context) => CategoriesDatabaseCubit(),
          ),
          BlocProvider(
            create: (context) => NewCategoryCubit(),
          ),
          BlocProvider(
            create: (context) => EditCategoryCubit(),
          ),
          BlocProvider(
            create: (context) => TextControllerTextVariableCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          routes: {
            "/new_task": (context) => const NewTaskPage(),
            "/categories": (context) => const CategoriesPage(),
            "/timer": (context) => const TimerPage(),
            "/recurring_task/select_category": (context) =>
                const SelectCategoryPage(),
            "/recurring_task/evaluate_progress": (context) =>
                const EvaluateProgressPage(),
            "/recurring_task/define_task": (context) => const DefineTaskPage(),
            "/recurring_task/how_often": (context) => const HowOftenPage(),
            "/recurring_task/when_todoit": (context) => const WhenToDoItPage(),
            "/edit_task": (context) => const EditTaskPage(),
            "/main": (context) => const MainPage(),
          },
          home: const MainPage(),
        ));
  }
}
