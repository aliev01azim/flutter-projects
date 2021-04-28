// import 'dart:async';

// class Validators {
//   final emailValidate =
//       StreamTransformer<String, String>.fromHandlers(handleData: (e, sink) {
//     if (e.contains('@')) {
//       sink.add(e);
//     } else {
//       sink.addError('Contain @');
//     }
//   });
//   final passwordValidate =
//       StreamTransformer<String, String>.fromHandlers(handleData: (e, sink) {
//     if (e.length > 3) {
//       sink.add(e);
//     } else {
//       sink.addError('at least 4 characters!');
//     }
//   });
// }

import 'dart:async';

class Validators {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError('error');
      }
    },
  );
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 3) {
        sink.add(data);
      } else {
        sink.addError('error');
      }
    },
  );
}
