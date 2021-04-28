import 'package:flutter/material.dart';
import 'package:news/src/blocs/comments_bloc.dart';
export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;
  CommentsProvider({Key key, Widget child})
      : bloc = CommentsBloc(),
        super(child: child, key: key);
  bool updateShouldNotify(_) => true;

  static CommentsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CommentsProvider>())
        .bloc;
  }
}
