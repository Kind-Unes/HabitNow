import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class TimerRecordState extends Equatable {
  final TimerRecordModel state;
  const TimerRecordState({required this.state});

  @override
  List<Object?> get props => [state];
}

class TimerRecordCubit extends Cubit<TimerRecordState> {
  TimerRecordCubit()
      : super(TimerRecordState(
            state: TimerRecordModel(
          isSaved: false,
          record: '00:00',
        )));

  void updateRecord(String record, bool isSaved) {
    emit(TimerRecordState(
        state: TimerRecordModel(isSaved: isSaved, record: record)));
  }
}
