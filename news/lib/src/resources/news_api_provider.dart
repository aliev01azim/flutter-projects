import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';

class NewsApiProvider implements Source {
  var _root = 'https://hacker-news.firebaseio.com/v0';
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    var response = await client.get('$_root/topstories.json');
    var ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    var response = await client.get('$_root/item/$id.json');
    var item = json.decode(response.body);
    return ItemModel.fromJson(item);
  }
}
