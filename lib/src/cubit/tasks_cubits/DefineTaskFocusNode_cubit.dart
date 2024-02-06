import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DefineTaskFocusNodeState extends Equatable {
  final FocusNode focusNode;

  const DefineTaskFocusNodeState(this.focusNode);

  @override
  List<Object?> get props => [focusNode];
}

class DefineTaskFocusNodeCubit extends Cubit<DefineTaskFocusNodeState> {
  final FocusNode focusNode = FocusNode();

  DefineTaskFocusNodeCubit() : super(DefineTaskFocusNodeState(FocusNode()));
}

class DefineSecondTaskFocusNodeState extends Equatable {
  final FocusNode focusNode;

  const DefineSecondTaskFocusNodeState(this.focusNode);

  @override
  List<Object?> get props => [focusNode];
}

class DefineSecondTaskFocusNodeCubit
    extends Cubit<DefineSecondTaskFocusNodeState> {
  final FocusNode focusNode = FocusNode();

  DefineSecondTaskFocusNodeCubit()
      : super(DefineSecondTaskFocusNodeState(FocusNode()));
}
