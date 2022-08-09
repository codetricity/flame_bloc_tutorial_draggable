import 'package:d1/blocs/star/star_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sliderLabels = ['star', 'jewel', 'heart', 'key', 'treasure'];
    return BlocBuilder<StarBloc, StarState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter Dashboard',
            ),
            Row(
              children: [
                const Text('moves remaining: '),
                Text(
                  ' ${state.starAmount}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              children: [
                const Text('motion: '),
                Text(' ${state.starMotionState.name}',
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            Slider(
              max: 4.0,
              divisions: 4,
              value: state.treasureSliderValue,
              label: sliderLabels[state.treasureSliderValue.toInt()],
              onChanged: (value) {
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
