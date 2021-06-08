import 'package:bloc_sessions/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  CounterBloc counter_bloc;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => (counter_bloc = CounterBloc()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('counter app'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is IncreamentState) {
                    return Text('${(i = state.i)}');
                  } else if (state is DecreamentState) {
                    Get.snackbar("decreament state", 'new value ${state.i}');
                    return Text('${(i = state.i)}');
                  } else if (state is CounterInitial) {
                    return Text('$i');
                  } else {
                    return Text('something went wrong');
                  }
                },
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      counter_bloc.add(IncreamentEvent(i: i));
                    },
                    child: Text(
                      'increament',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      counter_bloc.add(DecreamentEvent(i: i));
                    },
                    child: Text(
                      'decreament',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
