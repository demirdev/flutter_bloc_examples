import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_examples/login/authentication/bloc/authentication_bloc.dart';

import 'home/view/home_page.dart';
import 'login/view/login_page.dart';
import 'splash/view/splash_page.dart';

class LoginAppView extends StatefulWidget {
  const LoginAppView({Key? key}) : super(key: key);

  @override
  State<LoginAppView> createState() => _LoginAppViewState();
}

class _LoginAppViewState extends State<LoginAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.unknown:
                break;
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil(
                    HomePage.route(), (route) => false);
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil(
                    LoginPage.route(), (route) => false);
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
