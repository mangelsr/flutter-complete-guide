import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/products_bloc.dart';

class Provider extends InheritedWidget {
  final LoginBloc loginBloc = LoginBloc();
  final ProductsBloc _productsBloc = ProductsBloc();

  static late Provider _instance;

  factory Provider({required Widget child}) {
    if (_instance == null) {
      _instance = Provider._internal(child: child);
    }
    return _instance;
  }

  Provider._internal({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType() as Provider).loginBloc;
  }

  static ProductsBloc productsBloc(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType() as Provider)
        ._productsBloc;
  }
}
