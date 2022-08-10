import 'package:d1/blocs/star/star_bloc.dart';
import 'package:d1/flame_layer/my_game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart' hide Draggable;

class Star extends SpriteComponent
    with
        HasGameRef<MyGame>,
        Draggable,
        FlameBlocListenable<StarBloc, StarState> {
  StarState? starState;
  late Sprite starSprite;
  late Sprite heartSprite;
  late Sprite keySprite;
  late Sprite gemSprite;
  late Sprite treasureSprite;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    starSprite = await gameRef.loadSprite('star.png');
    gemSprite = await gameRef.loadSprite('gem.png');
    heartSprite = await gameRef.loadSprite('heart.png');
    keySprite = await gameRef.loadSprite('key.png');
    treasureSprite = await gameRef.loadSprite('treasure.png');
    sprite = starSprite;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    size = Vector2.all(100);
  }

  @override
  void onNewState(StarState state) {
    starState = state;
    if (gameRef.starBloc.state.starMotionState == StarMotionState.moving) {
      tint(Colors.black.withOpacity(0.7));
    } else {
      tint(Colors.white.withOpacity(0));
    }

    switch (gameRef.starBloc.state.treasureSliderValue.toInt()) {
      case 0:
        sprite = starSprite;
        break;
      case 1:
        sprite = gemSprite;
        break;
      case 2:
        sprite = heartSprite;
        break;
      case 3:
        sprite = keySprite;
        break;
      case 4:
        sprite = treasureSprite;
        break;
    }
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (parent is! FlameBlocProvider) {
      return true;
    }

    position.add(info.delta.game);

    return false;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    gameRef.starBloc.add(const SetStarMotionEvent(StarMotionState.moving));
    print('start drag');
    return super.onDragStart(info);
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    print('drag ended');
    gameRef.starBloc.add(DecreaseStarEvent());
    // gameRef.starBloc.add(StopStarMotionEvent());
    gameRef.starBloc.add(const SetStarMotionEvent(StarMotionState.stop));

    return super.onDragEnd(info);
  }
}
