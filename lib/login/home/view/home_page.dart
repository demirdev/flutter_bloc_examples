import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_examples/login/authentication/bloc/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              final userId = context
                  .select((AuthenticationBloc bloc) => bloc.state.user.id);
              return Text('userId: $userId');
            }),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }

  static Route route() => MaterialPageRoute(builder: (_) => HomePage());
}
