import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TextFieldCubit extends Cubit<void Function()> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  TextFieldCubit() : super(() {});

  void initializeTextField() {
    // Set the initial text and highlight it
    controller.text = '1';
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );

    // Request focus to automatically highlight the text
    focusNode.requestFocus();
    emit(() {});
  }

  void decrement() {
    // Get the current value as an integer
    int currentValue = int.tryParse(controller.text) ?? 0;

    // Decrement the value
    currentValue--;

    // Update the text controller with the new value
    controller.text = currentValue.toString();

    // Highlight the updated text
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );

    // Notify the UI to rebuild
    emit(() {});
  }

  void increment() {
    // Get the current value as an integer
    int currentValue = int.tryParse(controller.text) ?? 0;

    // Increment the value
    currentValue++;

    // Update the text controller with the new value
    controller.text = currentValue.toString();

    // Highlight the updated text
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );

    // Notify the UI to rebuild
    emit(() {});
  }
}
