import 'package:flutter/foundation.dart';

class Transaction {
  final String id; //zdes bil int a ne string
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    this.id,
    @required this.title,
    @required this.amount,
    this.date,
  });
}
