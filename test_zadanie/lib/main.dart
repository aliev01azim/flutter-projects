import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/auth.dart';
import 'package:test_zadanie/providers/comments.dart';
import 'package:test_zadanie/providers/photos.dart';
import 'package:test_zadanie/providers/posts.dart';
import 'package:test_zadanie/providers/users.dart';
import 'package:test_zadanie/screens/auth_screen.dart';
import 'package:test_zadanie/screens/favorite_photos_screen.dart';
import 'package:test_zadanie/screens/photo_detail_screen.dart';
import 'package:test_zadanie/screens/photos_screen.dart';
import 'package:test_zadanie/screens/post_detail_screen.dart';
import 'package:test_zadanie/screens/posts_screen.dart';
import 'package:test_zadanie/screens/user_screen.dart';
import 'helpers/custom_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Photos()),
        ChangeNotifierProvider.value(value: Posts()),
        ChangeNotifierProvider.value(value: Users()),
        ChangeNotifierProvider.value(value: Comments()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Zadanie',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            })),
        home: AuthScreen(),
        routes: {
          PhotoDetailScreen.routeName: (ctx) => PhotoDetailScreen(),
          FavoritePhotosScreen.routeName: (ctx) => FavoritePhotosScreen(),
          PostsScreen.routeName: (ctx) => PostsScreen(),
          PostDetailScreen.routeName: (ctx) => PostDetailScreen(),
          UserScreen.routeName: (ctx) => UserScreen(),
          PhotosScreen.routeName: (ctx) => PhotosScreen(),
        },
      ),
    );
  }
}
