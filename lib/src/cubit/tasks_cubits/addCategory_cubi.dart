import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/models/task_model.dart';
import 'package:uuid/uuid.dart';

class NewCategoryState extends Equatable {
  final CategoryModel categoryModel;

  const NewCategoryState(this.categoryModel);

  @override
  List<Object?> get props => [categoryModel];
}

class NewCategoryCubit extends Cubit<NewCategoryState> {
  NewCategoryCubit()
      : super(NewCategoryState(CategoryModel(
            color: AppColors.kLightPurple,
            icon: Icons.category,
            id: const Uuid().v4(),
            name: 'New category')));

  void updateProperty(
      {String? name,
      String? id,
      IconData? icon,
      Color? color,
      bool? isPendingTask}) {
    final CategoryModel updatedTaskModel = CategoryModel(
      name: name ?? state.categoryModel.name,
      id: id ?? state.categoryModel.id,
      color: color ?? state.categoryModel.color,
      icon: icon ?? state.categoryModel.icon,
    );
    emit(NewCategoryState(updatedTaskModel));
  }

  void initState() {
    emit(NewCategoryState(CategoryModel(
        color: AppColors.kLightPurple,
        icon: Icons.category,
        id: const Uuid().v4(),
        name: 'New category')));
  }
  //! implement more if needed
}

