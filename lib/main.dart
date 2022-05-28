import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/counter/cubit/counter_observer.dart';
import 'package:user_repository/user_repository.dart';

import 'login/login_app.dart';

void main() {
  // BlocOverrides.runZoned(
  //     () => runApp(
  //           MaterialApp(
  //             // home: TimerHomeScreen(),
  //             // home: CounterHomeScreen(),
  //             // home: InfiniteListHomeScreen(),
  //             home: LoginMain(),
  //           ),
  //         ),
  //     blocObserver: CounterObserver());
  //

  /// Use this for run Login app
  BlocOverrides.runZoned(
      () => runApp(
            LoginApp(
              authenticationRepository: AuthenticationRepository(),
              userRepository: UserRepository(),
            ),
          ),
      blocObserver: CounterObserver());
}
