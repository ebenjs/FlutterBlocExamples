part of 'counter_cubit_cubit.dart';

class CounterCubitState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterCubitState({@required this.counterValue, this.wasIncremented});

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncremented];
}
