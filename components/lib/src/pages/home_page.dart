import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Componets'),
          ),
          body: _list(),
        ),
      );

  Widget _list() => FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return ListView(
            children: _listItems(snapshot.data!, context),
          );
        },
      );

  List<Widget> _listItems(List data, BuildContext context) => data
      .map((option) => ListTile(
            title: Text(option['texto']),
            leading: getIcon(option['icon']),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
            onTap: () {
              // Navegacion a widget sin npmbre
              // final route = MaterialPageRoute(
              //     builder: (BuildContext context) => AlertPage());
              // Navigator.push(context, route);

              Navigator.pushNamed(context, option['ruta']);
            },
          ))
      .toList();
}
