import 'package:flutter/material.dart';
import 'package:test_zadanie/providers/comments.dart';

class Comment extends StatelessWidget {
  final CommentModel comment;
  Comment(this.comment);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(label: Text(comment.email)),
          Text(
            comment.name,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            comment.body,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
