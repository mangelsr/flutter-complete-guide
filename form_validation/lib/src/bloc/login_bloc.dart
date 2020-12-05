import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:form_validation/src/bloc/validators.dart';

class LoginBloc with Validators {
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(mailValidation);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidation);

  Stream<bool> get formValidStream => Observable.combineLatest2(
      emailStream, passwordStream, (email, password) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
