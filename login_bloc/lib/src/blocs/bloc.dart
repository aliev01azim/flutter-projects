// import 'dart:async';
// import 'package:rxdart/rxdart.dart';
// import 'package:login_bloc/src/blocs/validators.dart';

// class Bloc extends Object with Validators {
//   final _email = BehaviorSubject<String>();
//   final _password = BehaviorSubject<String>();

//   Stream<String> get email => _email.stream.transform(emailValidate);
//   Stream<String> get password => _password.stream.transform(passwordValidate);
//   Stream<bool> get submit => Rx.combineLatest2(email, password, (e, p) => true);
//   Function(String) get emailChange => _email.sink.add;
//   Function(String) get passwordChange => _password.sink.add;

//   dispose() {
//     _email.close();
//     _password.close();
//   }

//   submitButton() {
//     final validEmail = _email.value;
//     final validPassword = _password.value;
//     print('my email is - $validEmail and password is - $validPassword');
//   }
// }

// final bloc = Bloc();

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Streams

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<bool> get button => Rx.combineLatest2(email, password, (a, b) => true);
  // Sink

  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;
}
