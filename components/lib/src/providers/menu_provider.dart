import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  Future<List> loadData() async {
    final String data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);
    return dataMap['rutas'];
  }
}

final menuProvider = _MenuProvider();
