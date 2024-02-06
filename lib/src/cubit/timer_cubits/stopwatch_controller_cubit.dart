import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_controller_state.dart';
import 'package:habit_now/src/utils/const.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState(Strings.kStopState));

  void pressedStart() {
    emit(const TimerState(Strings.kRunState));
  }

  void pressedPause() {
    emit(const TimerState(Strings.kPausetState));
  }

  void pressedStop() {
    emit(const TimerState(Strings.kStopState));
  }
}
