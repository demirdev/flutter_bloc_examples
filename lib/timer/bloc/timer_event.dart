part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimerStarted extends TimerEvent {
  TimerStarted(this.duration);
  final int duration;
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  TimerTicked(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];
}
