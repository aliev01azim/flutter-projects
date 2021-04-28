import 'package:quiz/stream/validation.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _title = BehaviorSubject<String>();
  final _amount = BehaviorSubject<String>();

  Stream<String> get title => _title.stream.transform(titleValidator);
  Stream<String> get amount => _amount.stream.transform(amountValidator);
  Stream<bool> get submit => Rx.combineLatest2(title, amount, (a, b) => true);

  Function(String) get titleChange => _title.sink.add;
  Function(String) get amountChange => _amount.sink.add;
}
