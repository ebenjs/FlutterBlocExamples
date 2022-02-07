import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter cubit test', () {
    CounterCubitCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubitCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'Initial state for the CounterCubit is CounterCubitState(counterValue: 0)',
        () {
      expect(counterCubit.state, CounterCubitState(counterValue: 0));
    });

    blocTest(
      'cubit shoul emit a CounterState(counterValue : 1, wasIncremented: true) when cubit.increment() function is called',
      build: () => CounterCubitCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [CounterCubitState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'cubit shoul emit a CounterState(counterValue : -1, wasIncremented: false) when cubit.decrement() function is called',
      build: () => CounterCubitCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () =>
          [CounterCubitState(counterValue: -1, wasIncremented: false)],
    );
  });
}
