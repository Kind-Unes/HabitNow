import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TextControllerTextVariableCubit extends Cubit<String> {
  TextControllerTextVariableCubit() : super("");

  void updateTextFeildText(String newText) {
    emit(state);
  }
}

// Text Editing Controller
class TextEditingControllerState extends Equatable {
  final TextEditingController textEditingController;

  const TextEditingControllerState(this.textEditingController);

  @override
  List<Object?> get props => [textEditingController];
}

class TextEditingControllerCubit extends Cubit<TextEditingControllerState> {
  final TextEditingController controller = TextEditingController();

  TextEditingControllerCubit()
      : super(TextEditingControllerState(TextEditingController()));

  void updateController(TextEditingController controller) {
    emit(TextEditingControllerState(controller));
  }

  void updateTextField(String newText) {
    state.textEditingController.text = newText;
    emit(state);
  }
}

// FocusNode Controllers

// Controllers State
class FocusNodeState extends Equatable {
  final FocusNode focusNode;

  const FocusNodeState(this.focusNode);

  @override
  List<Object?> get props => [focusNode];
}

// Controller 1
class FocusNodeCubit extends Cubit<FocusNodeState> {
  final FocusNode focusNode = FocusNode();

  FocusNodeCubit() : super(FocusNodeState(FocusNode()));

  void updateFocusNode(FocusNode focusNode) {
    emit(FocusNodeState(focusNode));
  }
}

// Controller 2
class SecondFocusNodeCubit extends Cubit<FocusNodeState> {
  final FocusNode focusNode = FocusNode();

  SecondFocusNodeCubit() : super(FocusNodeState(FocusNode()));

  void updateFocusNode(FocusNode focusNode) {
    emit(FocusNodeState(focusNode));
  }
}
