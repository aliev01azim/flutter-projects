import 'dart:async';

class Validator {
  final titleValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (!data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError('error');
      }
    },
  );
  final amountValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 3) {
        sink.add(data);
      } else {
        sink.addError('error');
      }
    },
  );
}
