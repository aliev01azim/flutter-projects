import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_zadanie/screens/auth_screen.dart';
import 'package:test_zadanie/screens/favorite_photos_screen.dart';
import 'package:test_zadanie/screens/photos_screen.dart';
import 'package:test_zadanie/screens/posts_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Center(
                child: Text(
              'Main Drawer',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('All Photos'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(PhotosScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Favorite Photos'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FavoritePhotosScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Posts'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(PostsScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
