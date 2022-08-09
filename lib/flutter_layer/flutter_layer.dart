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
            Text(
              'Flutter Dashboard',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Moves Left: ${state.starAmount}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text('Motion State: ${state.starMotionState.name}',
                style: Theme.of(context).textTheme.bodyText1),
            Slider(
              max: 5.0,
              divisions: 5,
              value: state.treasureSliderValue,
              label: state.treasureSliderValue.toInt().toString(),
              onChanged: (value) {
                print(value);
                context
                    .read<StarBloc>()
                    .add(ChangeIncrementEvent(value: value));
              },
            ),
          ],
        );
      },
    );
  }
}
