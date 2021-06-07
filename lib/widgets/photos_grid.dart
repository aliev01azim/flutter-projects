import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/photo.dart';
import 'package:test_zadanie/providers/photos.dart';
import 'package:test_zadanie/screens/photo_detail_screen.dart';

class PhotosGridItem extends StatelessWidget {
  final PhotoModel photo;

  PhotosGridItem(this.photo);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(PhotoDetailScreen.routeName, arguments: photo.id);
            },
            child: Hero(
              tag: photo.id,
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/product-placeholder.png'),
                image: NetworkImage(photo.thumbnailUrl),
                fit: BoxFit.cover,
              ),
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<PhotoModel>(
            builder: (ctx, photo, _) => IconButton(
              icon: Icon(
                photo.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                photo.toggleFavoriteStatus();
                Provider.of<Photos>(context, listen: false)
                    .addToFavorites(photo);
              },
            ),
          ),
          title: Text(
            photo.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
