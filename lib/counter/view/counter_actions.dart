import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterActions extends StatelessWidget {
  const CounterActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: Text("+"),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: Text("-"),
          ),
        ],
      ),
    );
  }
}
