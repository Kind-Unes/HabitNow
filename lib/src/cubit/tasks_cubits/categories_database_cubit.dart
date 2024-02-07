import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class CategoriesDatabaseCubit extends Cubit<List<CategoryModel>> {
  CategoriesDatabaseCubit() : super([]) {
    getTasks();
  }

  Future<void> createCategory(CategoryModel categoryModel) async {
    await customCategories.put(categoryModel.id, categoryModel);

    print(customCategories.values.length);
  }

  void getTasks() {
    final data =
        customCategories.values.map((value) => value as CategoryModel).toList();
    emit(data);
  }

  Future<void> updateTask(CategoryModel updatedTask) async {
    final index = customCategories.values
        .toList()
        .indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      await customCategories.putAt(index, updatedTask);
      final updatedData = customCategories.values
          .map((value) => value as CategoryModel)
          .toList();
      emit(updatedData);
    }
  }

  Future<void> deleteTask(CategoryModel taskToDelete) async {
    final index = customCategories.values
        .toList()
        .indexWhere((task) => task.id == taskToDelete.id);

    if (index != -1) {
      await customCategories.deleteAt(index);
      final updatedData = customCategories.values
          .map((value) => value as CategoryModel)
          .toList();
      emit(updatedData);
    }
  }
}
