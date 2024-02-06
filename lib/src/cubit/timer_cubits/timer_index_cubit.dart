import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_state.dart';

class TimerPageViewCubit extends Cubit<TimerPageViewState> {
  TimerPageViewCubit.TimerIndexCubit() : super(const TimerPageViewState(1));

  void updateIndex(int newIndex) {
    emit(TimerPageViewState(newIndex));
  }
}
