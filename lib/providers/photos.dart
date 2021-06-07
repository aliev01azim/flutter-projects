import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_zadanie/providers/photo.dart';

class Photos with ChangeNotifier {
  List<PhotoModel> _photos = [];
  List<PhotoModel> _favoritePhotos = [];
  List<PhotoModel> get photos {
    return [..._photos];
  }

  void addToFavorites(PhotoModel photo) {
    if (photo.isFavorite) {
      _favoritePhotos.add(photo);
      notifyListeners();
    } else {
      _favoritePhotos.remove(photo);
      notifyListeners();
    }
  }

  List<PhotoModel> get favoritePhotos {
    return _photos.where((element) => element.isFavorite).toList();
  }

  Future<void> fetchAndSetPhotos(BuildContext context) async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Отсутствует соединение!'),
          content: const Text(
              'Проверьте вашe интернет соединение и попробуйте еще раз!'),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        ),
      );
    } else {
      try {
        const url = 'https://jsonplaceholder.typicode.com/photos';
        final response = await get(url);
        final List<PhotoModel> loadedData = [];
        final extractedData = json.decode(response.body) as List<dynamic>;

        if (extractedData == null) {
          return;
        }

        extractedData.forEach((value) {
          loadedData.add(PhotoModel(
            albumId: value['albumId'],
            id: value['id'],
            title: value['title'],
            url: value['url'],
            thumbnailUrl: value['thumbnailUrl'],
          ));
        });
        _photos = loadedData;
        notifyListeners();
      } catch (error) {
        throw (error);
      }
    }
  }

  PhotoModel findById(int id) {
    return _photos.firstWhere((element) => element.id == id);
  }
}
