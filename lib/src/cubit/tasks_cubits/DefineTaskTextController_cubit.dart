import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DefineTaskTextEditingControllerState extends Equatable {
  final TextEditingController textEditingController;

  const DefineTaskTextEditingControllerState(this.textEditingController);

  @override
  List<Object?> get props => [textEditingController];
}

class DefineTaskTextEditingControllerCubit
    extends Cubit<DefineTaskTextEditingControllerState> {
  final TextEditingController myController = TextEditingController();

  DefineTaskTextEditingControllerCubit()
      : super(DefineTaskTextEditingControllerState(TextEditingController()));

  // Not yet
  void updateController(TextEditingController textEditingController) {}
}
