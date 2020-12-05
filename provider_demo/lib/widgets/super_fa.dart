import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:provider_demo/providers/heros_info.dart';

class SuperFA extends StatelessWidget {
  const SuperFA({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroInfo = Provider.of<HeroInfo>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            heroInfo.hero = 'Tony Stark';
          },
          backgroundColor: Colors.red,
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            heroInfo.hero = 'Iron Man';
          },
          backgroundColor: Colors.green,
        )
      ],
    );
  }
}
