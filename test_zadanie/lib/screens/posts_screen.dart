import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/posts.dart';
import 'package:test_zadanie/widgets/main_drawer.dart';
import 'package:test_zadanie/widgets/new_post.dart';
import 'package:test_zadanie/widgets/post_item.dart';

class PostsScreen extends StatelessWidget {
  static const routeName = '/posts-screen';
  Future<void> _refresh(BuildContext context) async {
    await Provider.of<Posts>(context, listen: false).fetchAndSetPosts(context);
  }

  void _showOkno(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewPost(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showOkno(context),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: _refresh(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refresh(context),
                    child: Consumer<Posts>(
                      builder: (context, value, _) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: value.posts.length,
                          itemBuilder: (context, index) =>
                              PostItem(value.posts[index]),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
