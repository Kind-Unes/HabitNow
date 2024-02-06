import 'package:habit_now/src/utils/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class VolumeActionButtonCubit extends Cubit<Color> {
  VolumeActionButtonCubit() : super(AppColors.kLightOffGray);


  void pressButton() {
    emit(state == AppColors.kLightOffGray
        ? AppColors.kLightOnGray
        : AppColors.kLightOffGray);
  }
}

class VibrateActionButtonCubit extends Cubit<Color> {
  VibrateActionButtonCubit() : super(AppColors.kLightOffGray);

  void pressButton() {
    emit(state == AppColors.kLightOffGray
        ? AppColors.kLightOnGray
        : AppColors.kLightOffGray);
  }
}
