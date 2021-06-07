import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/photos.dart';
import 'package:test_zadanie/widgets/main_drawer.dart';
import 'package:test_zadanie/widgets/photos_grid.dart';

class FavoritePhotosScreen extends StatelessWidget {
  static const routeName = '/favorite-photos-screen';
  @override
  Widget build(BuildContext context) {
    final favs = Provider.of<Photos>(context).favoritePhotos;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (_, index) => ChangeNotifierProvider.value(
              value: favs[index],
              child: PhotosGridItem(favs[index]),
            ),
            itemCount: favs.length,
          ),
        ));
  }
}
