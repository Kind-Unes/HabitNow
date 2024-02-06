import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(const DialogState(0));

  void getAnswer(int answer) {
    emit(DialogState(answer));
  }
}
