import 'package:d1/blocs/star/star_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreasureDrawer extends StatelessWidget {
  const TreasureDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
