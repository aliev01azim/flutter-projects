import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });
}

class Posts with ChangeNotifier {
  List<PostModel> _posts = [];
  List<PostModel> get posts {
    return [..._posts];
  }

  Future<void> fetchAndSetPosts(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Отсутствует соединение!'),
          content:
              Text('Проверьте вашe интернет соединение и попробуйте еще раз!'),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        ),
      );
    } else {
      const url = 'https://jsonplaceholder.typicode.com/posts';
      final response = await get(url);
      final List<PostModel> loadedPosts = [];
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((post) {
        loadedPosts.add(PostModel(
            userId: post['userId'],
            id: post['id'],
            title: post['title'],
            body: post['body']));
      });
      _posts = loadedPosts;
      notifyListeners();
    }
  }

  PostModel findById(int id) {
    return _posts.firstWhere((element) => element.id == id);
  }

  Future<void> addPost(String title, String body) async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/posts';
      final response = await post(
        url,
        body: json.encode({
          'userId': 1,
          'title': title,
          'body': body,
        }),
      );
      final newPost = PostModel(
          userId: 1,
          id: json.decode(response.body)['id'],
          title: title,
          body: body);
      _posts.insert(0, newPost);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
// filtratsiyu postov sprosit', sqflite
