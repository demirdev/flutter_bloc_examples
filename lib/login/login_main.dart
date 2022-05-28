import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

import 'login_app.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    );
  }
}
