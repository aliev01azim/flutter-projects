import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/photos.dart';
import 'package:test_zadanie/widgets/full-screen-image.dart';

class PhotoDetailScreen extends StatelessWidget {
  static const routeName = '/photo-detail-screen';
  @override
  Widget build(BuildContext context) {
    final photoId = ModalRoute.of(context).settings.arguments as int;
    final loadedPhoto = Provider.of<Photos>(
      context,
      listen: false,
    ).findById(photoId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPhoto.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Hero(
            tag: loadedPhoto.id,
            child: GestureDetector(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Image.network(
                  loadedPhoto.url,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenImage(
                    imageUrl: loadedPhoto.url,
                    tag: loadedPhoto.id,
                  );
                }));
              },
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\$${loadedPhoto.albumId}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loadedPhoto.title,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
