// import 'package:flutter/material.dart';
// import 'src/app.dart';

// void main() {
//   runApp(App());
// }
// // main
// class ImageModel {
//   int id;
//   String url;
//   String title;

//   ImageModel(this.id, this.url, this.title);

//   ImageModel.fromJson(Map<String, dynamic> parsedJson) {
//     id = parsedJson['id'];
//     url = parsedJson['url'];
//     title = parsedJson['title'];
//   }
// }
// // image_model.dart
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' show get;
// import 'models/image_model.dart';
// import 'dart:convert';
// import 'widgets/image_list.dart';

// class App extends StatefulWidget {
//   createState() => AppState();
// }

// class AppState extends State<App> {
//   int counter = 0;
//   List<ImageModel> images = [];

//   void fetchImage() async {
//     counter++;
//     var response =
//         await get('https://jsonplaceholder.typicode.com/photos/$counter');
//     var imageModel = ImageModel.fromJson(json.decode(response.body));

//     setState(() {
//       images.add(imageModel);
//     });
//   }

//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ImageList(images),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: fetchImage,
//         ),
//         appBar: AppBar(
//           title: Text('Lets see some images!'),
//         ),
//       ),
//     );
//   }
// }
// // app.dart

// import 'package:flutter/material.dart';
// import '../models/image_model.dart';

// class ImageList extends StatelessWidget {
//   final List<ImageModel> images;

//   ImageList(this.images);

//   Widget build(context) {
//     return ListView.builder(
//       itemCount: images.length,
//       itemBuilder: (context, int index) {
//         return buildImage(images[index]);
//       },
//     );
//   }

//   Widget buildImage(ImageModel image) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//       ),
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.all(20.0),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             child: Image.network(image.url),
//             padding: EdgeInsets.only(bottom: 8.0),
//           ),
//           Text(image.title),
//         ],
//       ),
//     );
//   }
// }

// // image_list
