// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'star_bloc.dart';

enum StarMotionState { stop, moving }

@immutable
class StarState extends Equatable {
  final int starAmount;
  final StarMotionState starMotionState;
  final double treasureSliderValue;

  const StarState(
    this.starAmount,
    this.starMotionState,
    this.treasureSliderValue,
  );

  factory StarState.initial() => const StarState(25, StarMotionState.stop, 0);

  StarState copyWith({
    int? starAmount,
    StarMotionState? starMotionState,
    double? treasureSliderValue,
  }) {
    return StarState(
      starAmount ?? this.starAmount,
      starMotionState ?? this.starMotionState,
      treasureSliderValue ?? this.treasureSliderValue,
    );
  }

  @override
  String toString() => 'StarState(starAmount: $starAmount)';

  @override
  List<Object> get props => [starAmount, starMotionState, treasureSliderValue];

  @override
  bool get stringify => true;
}
