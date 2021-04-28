import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  bool updateShouldNotify(_) => true;
  final Bloc bloc;
  Provider({Key key, Widget child})
      : bloc = Bloc(),
        super(child: child, key: key);

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}
