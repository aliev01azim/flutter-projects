import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  CommentModel(
      {@required this.body,
      @required this.email,
      @required this.id,
      @required this.name,
      @required this.postId});
}

class Comments with ChangeNotifier {
  List<CommentModel> _comments = [];
  List<CommentModel> get comments {
    return [..._comments];
  }

  void fetchAndSetComments() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/comments';
      final response = await get(url);
      List<CommentModel> loadedComments = [];
      final extractedData = json.decode(response.body) as List<dynamic>;

      extractedData.forEach((element) {
        loadedComments.add(CommentModel(
            body: element['body'],
            email: element['email'],
            id: element['id'],
            name: element['name'],
            postId: element['postId']));
      });
      _comments = loadedComments;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<CommentModel> postIdComments(int postId) {
    return _comments.where((element) => element.postId == postId).toList();
  }
}
