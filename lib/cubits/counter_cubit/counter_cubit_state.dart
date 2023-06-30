part of 'counter_cubit_cubit.dart';

enum CounterCubitStatus { initial, loading, success, failure }

class CounterState extends Equatable {
  final int counterValue;

  CounterState({
    required this.counterValue,
  });

  factory CounterState.initial() {
    return CounterState(counterValue: 0);
  }

  @override
  List<Object> get props => [counterValue];

  @override
  String toString() {
    log('CounterState(counterValue: $counterValue)');
    return 'CounterState(counterValue: $counterValue)';
  }

  CounterState copyWith({
    int? counterValue,
  }) {
    log('CounterState(counterValue: $counterValue)');
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}
