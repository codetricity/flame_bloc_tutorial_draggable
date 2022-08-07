import 'package:d1/blocs/star/star_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StarBloc, StarState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Dashboard',
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            Text(
              'Moves Left: ${state.starAmount}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              'Motion State: ${state.starMotionState.name}',
              style: const TextStyle(color: Colors.white),
            )
          ],
        );
      },
    );
  }
}
