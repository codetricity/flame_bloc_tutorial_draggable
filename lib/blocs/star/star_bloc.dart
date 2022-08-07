import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'star_event.dart';
part 'star_state.dart';

class StarBloc extends Bloc<StarEvent, StarState> {
  StarBloc() : super(StarState.initial()) {
    on<IncreaseStarEvent>((event, emit) {
      emit(state.copyWith(starAmount: state.starAmount + 1));
    });
    on<DecreaseStarEvent>((event, emit) {
      emit(state.copyWith(starAmount: state.starAmount - 1));
    });
    on<SetStarMotionEvent>(
      (event, emit) {
        emit(state.copyWith(starMotionState: event.starMotionState));
      },
    );

    on<StopStarMotionEvent>((event, emit) {
      print('stopping motion from bloc');
      emit(state.copyWith(starMotionState: StarMotionState.stop));
    });
  }
}
