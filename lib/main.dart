import 'package:d1/blocs/star/star_bloc.dart';
import 'package:d1/flame_layer/flame_layer.dart';
import 'package:d1/flutter_layer/flutter_layer.dart';
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
            return Drawer(
              child: ListView(children: [
                const DrawerHeader(
                  child: Text('Treasure'),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/star.png'),
                    title: const Text("star"),
                    onTap: (() {
                      context
                          .read<StarBloc>()
                          .add(const ChangeIncrementEvent(value: 0.0));
                    }),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/gem.png'),
                    title: const Text("gem"),
                    onTap: (() {
                      context
                          .read<StarBloc>()
                          .add(const ChangeIncrementEvent(value: 1.0));
                    }),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/heart.png'),
                    title: const Text("heart"),
                    onTap: (() {
                      context
                          .read<StarBloc>()
                          .add(const ChangeIncrementEvent(value: 2.0));
                    }),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/key.png'),
                    title: const Text("key"),
                    onTap: (() {
                      context
                          .read<StarBloc>()
                          .add(const ChangeIncrementEvent(value: 3.0));
                    }),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/treasure.png'),
                    title: const Text("treasure"),
                    onTap: (() {
                      context
                          .read<StarBloc>()
                          .add(const ChangeIncrementEvent(value: 4.0));
                    }),
                  ),
                ),
              ]),
            );
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
