import 'package:flutter/material.dart';

bool isNumric(String value) {
  if (value.isEmpty) return false;
  final number = num.tryParse(value);
  return (number == null) ? false : true;
}

void displayAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Informacion incorrecta'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    }
  );
}