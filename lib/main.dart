import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/counter/counter_home_screen.dart';
import 'package:flutter_bloc_examples/counter/cubit/counter_observer.dart';
import 'package:flutter_bloc_examples/timer/timer_home_screen.dart';

void main() {
  BlocOverrides.runZoned(
      () => runApp(
            MaterialApp(
              // home: TimerHomeScreen(),
              home: CounterHomeScreen(),
            ),
          ),
      blocObserver: CounterObserver());
}
