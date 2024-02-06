// Events
import 'package:equatable/equatable.dart';

abstract class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object?> get props => [];
}

class StartEvent extends StopwatchEvent {}

class StopEvent extends StopwatchEvent {}

class ResetEvent extends StopwatchEvent {}

// States
class StopwatchState extends Equatable {
  final String formattedTime;
  final bool isRunning;

  const StopwatchState({required this.formattedTime, required this.isRunning});

  StopwatchState copyWith({String? formattedTime, bool? isRunning}) {
    return StopwatchState(
      formattedTime: formattedTime ?? this.formattedTime,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  List<Object?> get props => [formattedTime, isRunning];
}
