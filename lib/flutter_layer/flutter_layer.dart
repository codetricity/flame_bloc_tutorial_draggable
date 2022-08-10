import 'package:d1/blocs/star/star_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sliderLabels = ['star', 'jewel', 'heart', 'key', 'treasure'];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<StarBloc, StarState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Dashboard',
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    'moves: ',
                    style: TextStyle(fontSize: width > 500 ? 32 : 16),
                  ),
                  Text(
                    ' ${state.starAmount}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.starAmount,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'assets/images/star.png',
                            height: width > 500 ? 20 : 10,
                            width: width > 500 ? 20 : 10,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'motion: ',
                  style: TextStyle(fontSize: width > 500 ? 32 : 16),
                ),
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
            SizedBox(
              height: height / 2,
            ),
          ],
        );
      },
    );
  }
}
