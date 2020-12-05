import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:provider_demo/providers/heros_info.dart';
import 'package:provider_demo/widgets/super_fa.dart';
import 'package:provider_demo/widgets/super_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroInfo = Provider.of<HeroInfo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(heroInfo.hero),
      ),
      body: Center(child: SuperText()),
      floatingActionButton: SuperFA(),
    );
  }
}
