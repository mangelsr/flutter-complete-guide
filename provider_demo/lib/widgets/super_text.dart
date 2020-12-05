import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_demo/providers/heros_info.dart';

class SuperText extends StatelessWidget {
  const SuperText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<HeroInfo>(
          builder: (BuildContext context, HeroInfo heroInfo, Widget _) => Text(
            heroInfo.hero,
            style: TextStyle(
              fontSize: 30.0,
              color: heroInfo.baseColor,
            ),
          ),
        ),
      ],
    );
  }
}
