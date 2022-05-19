import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../timer.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is TimerInitial) ...[
                FloatingActionButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: () => context
                        .read<TimerBloc>()
                        .add(TimerStarted(state.duration)))
              ],
              if (state is TimerRunInProgress) ...[
                FloatingActionButton(
                    child: Icon(Icons.pause),
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerPaused()))
              ],
              if (state is TimerRunPause) ...[
                FloatingActionButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerResumed()))
              ],
              if (state is TimerRunComplete) ...[
                FloatingActionButton(
                    child: Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerReset()))
              ],
            ],
          ),
        );
      },
    );
  }
}
