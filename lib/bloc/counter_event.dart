part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent {
  int i;
  IncreamentEvent({this.i});
}

class DecreamentEvent extends CounterEvent {
  int i;
  DecreamentEvent({this.i});
}
