import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/models/task_model.dart';
import 'package:uuid/uuid.dart';

class NewTaskState extends Equatable {
  final TaskModel taskModel;

  const NewTaskState(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit()
      : super(NewTaskState(TaskModel(
            name: '',
            category: CategoryModel(
                color: AppColors.kLightPurple,
                name: "Task",
                icon: Icons.timer_outlined),
            date: DateTime.now(),
            reminder: ReminderModel(
              schedule: ReminderSchedule.alwaysEnabled,
              time: DateTime.now(),
              type: ReminderTime.dontRemind,
            ),
            priority: -1,
            note: '',
            isPendingTask: false,
            id: const Uuid().v4())));

  void updateProperty(
      {String? name,
      String? id,
      CategoryModel? category,
      DateTime? date,
      ReminderModel? reminder,
      int? priority,
      String? note,
      bool? isPendingTask}) {
    final TaskModel updatedTaskModel = TaskModel(
      name: name ?? state.taskModel.name,
      category: category ?? state.taskModel.category,
      date: date ?? state.taskModel.date,
      reminder: reminder ?? state.taskModel.reminder,
      priority: priority ?? state.taskModel.priority,
      note: note ?? state.taskModel.name,
      isPendingTask: isPendingTask ?? state.taskModel.isPendingTask,
      id: id ?? state.taskModel.id,
    );
    emit(NewTaskState(updatedTaskModel));
  }

  void initState() {
    emit(NewTaskState(TaskModel(
        name: '',
        category: CategoryModel(
            color: AppColors.kLightPurple, name: "Task", icon: Icons.abc),
        date: DateTime.now(),
        reminder: ReminderModel(
          schedule: ReminderSchedule.alwaysEnabled,
          time: DateTime.now(),
          type: ReminderTime.dontRemind,
        ),
        priority: 1,
        note: '',
        isPendingTask: false,
        id: const Uuid().v4())));
  }

  void initStateWithData(TaskModel taskModel) {
    final TaskModel updatedTaskModel = TaskModel(
      name: taskModel.name,
      category: taskModel.category,
      date: taskModel.date,
      reminder: taskModel.reminder,
      priority: taskModel.priority,
      note: taskModel.note,
      isPendingTask: taskModel.isPendingTask,
      id: taskModel.id,
    );
    emit(NewTaskState(updatedTaskModel));
  }
}

class EditTaskControllerCubit extends Cubit<void Function()> {
  EditTaskControllerCubit() : super(() {});
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void initializeTextField(String text) {
    // Set the initial text and highlight it
    controller.text = text;
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );

    // Request focus to automatically highlight the text
    focusNode.requestFocus();
    emit(() {});
  }
}
