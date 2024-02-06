import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_sttate.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  StopwatchCubit()
      : super(const StopwatchState(formattedTime: '00:00', isRunning: false));

  Timer? _timer;

  void startStopwatch() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        int newSeconds = int.parse(state.formattedTime.split(':')[1]) + 1;
        int newMinutes = int.parse(state.formattedTime.split(':')[0]);

        if (newSeconds == 60) {
          newSeconds = 0;
          newMinutes++;
        }

        String formattedTime =
            '${newMinutes.toString().padLeft(2, '0')}:${newSeconds.toString().padLeft(2, '0')}';

        emit(state.copyWith(formattedTime: formattedTime));
      });
    }
  }

  void stopStopwatch() {
    _timer?.cancel();
  }

  void resetStopwatch() {
    _timer?.cancel();
    emit(state.copyWith(formattedTime: '00:00', isRunning: false));
  }

  void onButtonPressed() {
    if (state.isRunning) {
      stopStopwatch();
    } else {
      startStopwatch();
    }
    emit(state.copyWith(isRunning: !state.isRunning));
  }
}
