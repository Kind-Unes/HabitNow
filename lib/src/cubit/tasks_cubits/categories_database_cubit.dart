import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class CategoriesDatabaseCubit extends Cubit<List<CategoryModel>> {
  CategoriesDatabaseCubit() : super([]) {
    getCategories();
  }

  Future<void> createCategory(CategoryModel categoryModel) async {
    await customCategoriesBox.put(categoryModel.id, categoryModel);

    print(customCategoriesBox.values.length);
  }

  void getCategories() {
    final data = customCategoriesBox.values
        .map((value) => value as CategoryModel)
        .toList();
    emit(data);
  }

  Future<void> updateCategory(CategoryModel updatedTask) async {
    final index = customCategoriesBox.values
        .toList()
        .indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      await customCategoriesBox.putAt(index, updatedTask);
      final updatedData = customCategoriesBox.values
          .map((value) => value as CategoryModel)
          .toList();
      emit(updatedData);
    }
  }

  Future<void> deleteCategory(CategoryModel taskToDelete) async {
    final index = customCategoriesBox.values
        .toList()
        .indexWhere((task) => task.id == taskToDelete.id);

    if (index != -1) {
      await customCategoriesBox.deleteAt(index);
      final updatedData = customCategoriesBox.values
          .map((value) => value as CategoryModel)
          .toList();
      emit(updatedData);
    }
  }
}
