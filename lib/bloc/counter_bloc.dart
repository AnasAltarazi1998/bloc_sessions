import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sessions/bloc/CounterService.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());
  CounterService counterService = CounterService();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    yield CounterInitial();
    if (event is IncreamentEvent) {
      Get.snackbar("increamnet state", 'new value ${event.i}');
      yield IncreamentState(i: counterService.increament(i: event.i));
    } else if (event is DecreamentEvent) {
      yield DecreamentState(i: counterService.decreament(i: event.i));
    }
  }
}
