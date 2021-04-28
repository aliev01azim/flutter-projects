import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/posts.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'title',
              ),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'body',
              ),
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<Posts>(context, listen: false)
                    .addPost(_titleController.text, _bodyController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Submit!'),
            )
          ],
        ),
      ),
    );
  }
}
