import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  final String state;

  const TimerState(this.state);

  @override
  List<Object?> get props => [state];
}
