import 'package:equatable/equatable.dart';

class TimerPageViewState extends Equatable {
  final int state;

  const TimerPageViewState(this.state);

  @override
  List<Object?> get props => [state];
}
