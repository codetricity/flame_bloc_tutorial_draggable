part of 'star_bloc.dart';

enum StarMotionState { stop, moving }

@immutable
class StarState extends Equatable {
  final int starAmount;
  final StarMotionState starMotionState;

  const StarState(
    this.starAmount,
    this.starMotionState,
  );

  factory StarState.initial() => const StarState(25, StarMotionState.stop);

  StarState copyWith({
    int? starAmount,
    StarMotionState? starMotionState,
  }) {
    return StarState(
      starAmount ?? this.starAmount,
      starMotionState ?? this.starMotionState,
    );
  }

  @override
  String toString() => 'StarState(starAmount: $starAmount)';

  @override
  List<Object> get props => [starAmount, starMotionState];

  @override
  bool get stringify => true;
}
