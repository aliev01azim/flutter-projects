import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/comments.dart';
import 'package:test_zadanie/providers/posts.dart';
import 'package:test_zadanie/screens/user_screen.dart';
import 'package:test_zadanie/widgets/comment.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = '/post-detail-screen';
  @override
  Widget build(BuildContext context) {
    //
    final postId = ModalRoute.of(context).settings.arguments as int;
    final post = Provider.of<Posts>(context, listen: false).findById(postId);
    Provider.of<Comments>(context, listen: false).fetchAndSetComments();
    final comments =
        Provider.of<Comments>(context, listen: false).postIdComments(postId);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.id} Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              'Title of post : ${post.title}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 14,
            ),
            const Text(
              'The body of post:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              post.body,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(UserScreen.routeName, arguments: post.userId);
              },
              icon: const Icon(Icons.supervised_user_circle),
              label: const Text('Go to detail of User'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 1)),
              padding: const EdgeInsets.all(5),
              height: min((comments.length * 60.0 + 20), 400),
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) => Comment(comments[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
