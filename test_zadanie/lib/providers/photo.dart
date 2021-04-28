import 'package:flutter/cupertino.dart';

class PhotoModel with ChangeNotifier {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  bool isFavorite;

  PhotoModel(
      {@required this.albumId,
      @required this.id,
      @required this.title,
      @required this.url,
      @required this.thumbnailUrl,
      this.isFavorite = false});

  // void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }
  // Future<void> toggleFavoriteStatus() async {
  //   final oldStatus = isFavorite;
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  //   final url = 'https://jsonplaceholder.typicode.com/photos/$id';
  //   try {
  //     final response = await put(
  //       url,
  //       body: json.encode(
  //         isFavorite,
  //       ),
  //     );
  //     print(response.body);
  //     if (response.statusCode >= 400) {
  //       _setFavValue(oldStatus);
  //     }
  //   } catch (error) {
  //     _setFavValue(oldStatus);
  //   }
  // }
  //
  //
  //
  // я не разобрался с апи этого (jsonplaceholder.typicode.com) как туда за-put-ить лайк на фото и при гет-запросе получать json вместе с этим лайком так сказать
  // поэтому сделал хранение лайканных фоток локально
  //
  void toggleFavoriteStatus() async {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
