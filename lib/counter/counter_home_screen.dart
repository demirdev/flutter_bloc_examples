import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/counter/view/counter_page.dart';

class CounterHomeScreen extends StatelessWidget {
  const CounterHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CounterPage(),
      ),
    );
  }
}
