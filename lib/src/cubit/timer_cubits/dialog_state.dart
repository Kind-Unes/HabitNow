import 'package:equatable/equatable.dart';

class DialogState extends Equatable {
  final int state;

  const DialogState(this.state);

  @override
  List<Object?> get props => [state];
}
