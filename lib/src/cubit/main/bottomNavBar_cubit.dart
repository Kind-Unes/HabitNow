import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarState extends Equatable {
  final int currentIndex; // Changed from 'state'

  const BottomNavBarState(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState(0));

  void updateIndex(newIndex) {
    emit(BottomNavBarState(newIndex));
  }
}
