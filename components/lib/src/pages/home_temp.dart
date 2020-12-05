import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
  final options = ['One', 'Two', 'Three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = [];

    for (String option in options) {
      final ListTile listTile = ListTile(
        title: Text(option),
      );
      list..add(listTile)..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() => options
      .map((String opt) => Column(
            children: <Widget>[
              ListTile(
                title: Text(opt),
                subtitle: Text('...'),
                leading: Icon(Icons.add),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
              Divider(),
            ],
          ))
      .toList();
}
