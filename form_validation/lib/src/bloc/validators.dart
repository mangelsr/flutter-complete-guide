import 'dart:async';

class Validators {
  final passwordValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else if (password.length == 0) {
      sink.addError('The password is required');
    } else {
      sink.addError('The password is too short');
    }
  });

  final mailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (mail, sink) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(mail)) {
      sink.add(mail);
    } else {
      sink.addError('Invalid mail');
    }
  });
}
