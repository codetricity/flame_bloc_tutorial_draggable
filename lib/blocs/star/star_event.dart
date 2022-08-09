part of 'star_bloc.dart';

@immutable
abstract class StarEvent extends Equatable {
  const StarEvent();

  @override
  List<Object> get props => [];
}

class IncreaseStarEvent extends StarEvent {}

class DecreaseStarEvent extends StarEvent {}

class SetStarMotionEvent extends StarEvent {
  final StarMotionState starMotionState;
  const SetStarMotionEvent(this.starMotionState);
}

class StopStarMotionEvent extends StarEvent {}

class ChangeIncrementEvent extends StarEvent {
  final double value;

  const ChangeIncrementEvent({required this.value});
}
