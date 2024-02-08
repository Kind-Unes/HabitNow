import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/models/reccurringTask_model.dart';

class RecurringTasksDatabaseCubit extends Cubit<List<ReccurringTaskModel>> {
  RecurringTasksDatabaseCubit() : super([]) {
    getTasks();
  }

  Future<void> createTask(ReccurringTaskModel taskModel) async {
    await tasksBox.put(taskModel.id, taskModel);

    print(tasksBox.values.length);
  }

  void getTasks() {
    final data =
        tasksBox.values.map((value) => value as ReccurringTaskModel).toList();
    emit(data);
  }

  Future<void> updateTask(ReccurringTaskModel updatedTask) async {
    final index = tasksBox.values
        .toList()
        .indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      await tasksBox.putAt(index, updatedTask);
      final updatedData =
          tasksBox.values.map((value) => value as ReccurringTaskModel).toList();
      emit(updatedData);
    }
  }

  Future<void> deleteTask(ReccurringTaskModel taskToDelete) async {
    final index = tasksBox.values
        .toList()
        .indexWhere((task) => task.id == taskToDelete.id);

    if (index != -1) {
      await tasksBox.deleteAt(index);
      final updatedData =
          tasksBox.values.map((value) => value as ReccurringTaskModel).toList();
      emit(updatedData);
    }
  }
}
