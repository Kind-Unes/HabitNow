import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class TasksDatabaseCubit extends Cubit<List<TaskModel>> {
  TasksDatabaseCubit() : super([]);

  Future<void> createTask(TaskModel taskModel) async {
    await tasksBox.put(taskModel.id, taskModel);

    print(tasksBox.values
        .where((e) => e.id == "012bc013-a38d-4371-9da0-629db8a2d16f"));
  }

  void getTasks() {
    final data = tasksBox.values.map((value) => value as TaskModel).toList();
    emit(data);
  }

  Future<void> updateTask(TaskModel updatedTask) async {
    final index = tasksBox.values
        .toList()
        .indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      await tasksBox.putAt(index, updatedTask);
      final updatedData =
      
          tasksBox.values.map((value) => value as TaskModel).toList();
      emit(updatedData);
    }
  }

  Future<void> deleteTask(TaskModel taskToDelete) async {
    final index = tasksBox.values
        .toList()
        .indexWhere((task) => task.id == taskToDelete.id);

    if (index != -1) {
      await tasksBox.deleteAt(index);
      final updatedData =
          tasksBox.values.map((value) => value as TaskModel).toList();
      emit(updatedData);
    }
  }
}
