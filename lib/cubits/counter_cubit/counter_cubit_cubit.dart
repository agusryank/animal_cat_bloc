import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void addCounter() {
    emit(state.copyWith(counterValue: state.counterValue + 1));
  }

  void removeCounter() {
    emit(state.copyWith(counterValue: state.counterValue - 1));
  }
}
