// ignore: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class TodayListViewState extends Equatable {
  final int currentIndex;

  const TodayListViewState(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class TodayListViewCubit extends Cubit<TodayListViewState> {
  TodayListViewCubit() : super(const TodayListViewState((100)));

  void updateSelection(index) {
    emit(TodayListViewState(index));
  }
}
