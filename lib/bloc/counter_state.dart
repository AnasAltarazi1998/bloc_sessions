part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class IncreamentState extends CounterState {
  int i;
  IncreamentState({this.i});
}

class DecreamentState extends CounterState {
  int i;
  DecreamentState({this.i});
}
