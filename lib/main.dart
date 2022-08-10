import 'package:d1/blocs/star/star_bloc.dart';
import 'package:d1/flame_layer/flame_layer.dart';
import 'package:d1/flutter_layer/flutter_layer.dart';
import 'package:d1/flutter_layer/treasure_drawer.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: 30, color: Colors.yellow[50]),
        bodyText1: TextStyle(fontSize: 36, color: Colors.lightBlue[100]),
      ),
    ),
    home: MultiBlocProvider(
      providers: [BlocProvider<StarBloc>(create: (_) => StarBloc())],
      child: Scaffold(
        drawer: BlocBuilder<StarBloc, StarState>(
          builder: (context, state) {
            return const TreasureDrawer();
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text('Flutter BLoC and Flame'),
        ),
        body: Stack(
          children: const [
            FlameLayer(),
            FlutterLayer(),
          ],
        ),
      ),
    ),
  ));
}
