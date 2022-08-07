import 'package:d1/actors/star.dart';
import 'package:d1/blocs/star/star_bloc.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';

class MyGame extends FlameGame with HasDraggables {
  StarBloc starBloc;
  MyGame(this.starBloc);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(FlameBlocProvider<StarBloc, StarState>.value(
        value: starBloc, children: [Star()]));
  }
}
