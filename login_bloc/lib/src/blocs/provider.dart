// import 'package:flutter/material.dart';
// import 'bloc.dart';

// class Provider extends InheritedWidget {
//   final bloc = Bloc();
//   Provider({Key key, Widget child}) : super(key: key, child: child);
//   bool updateShouldNotify(_) => true;

//   static Bloc of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
//   }
// }
import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc;
  bool updateShouldNotify(_) => true;
  Provider({Key key, Widget child})
      : bloc = Bloc(),
        super(child: child, key: key);
  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}
