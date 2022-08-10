import 'package:d1/blocs/star/star_bloc.dart';
import 'package:d1/flame_layer/my_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGame(context.read<StarBloc>()));
  }
}
