import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class TextFieldsCubit extends Cubit<int> {
  TextFieldsCubit()
      : super(1); // Initial state, indicating the first text field

  void moveToNextTextField() {
    emit(state + 1);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TextFieldsCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Fields Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TextFieldsCubit, int>(
          builder: (context, currentTextFieldIndex) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Text Field $currentTextFieldIndex'),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    context.read<TextFieldsCubit>().moveToNextTextField();
                  },
                ),
                const SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                      labelText: 'Text Field $currentTextFieldIndex'),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    context.read<TextFieldsCubit>().moveToNextTextField();
                  },
                ),
                // You can add more text fields based on your needs
                // For example, if you want to have a fixed number of text fields, you can create multiple TextFields here.
              ],
            );
          },
        ),
      ),
    );
  }
}
