import 'package:flutter/material.dart';
import 'package:test_zadanie/providers/posts.dart';
import 'package:test_zadanie/screens/post_detail_screen.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  PostItem(this.post);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Post number ${post.id}'),
      subtitle: Text('Posted by ${post.userId} user'),
      trailing: const Icon(Icons.local_post_office),
      onTap: () {
        Navigator.of(context)
            .pushNamed(PostDetailScreen.routeName, arguments: post.id);
      },
    );
  }
}
