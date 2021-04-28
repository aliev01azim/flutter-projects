// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_application_1_from_course/src/models/image_model.dart';
// // // import 'package:flutter_application_1_from_course/src/widgets/image_list.dart';
// // // import 'package:http/http.dart';

// // // class App extends StatefulWidget {
// // //   @override
// // //   _AppState createState() => _AppState();
// // // }

// // // class _AppState extends State<App> {
// // //   List<ImageModel> list = [];
// // //   int counter = 0;
// // //   void fetch() async {
// // //     counter++;
// // //     var response =
// // //         await get('https://jsonplaceholder.typicode.com/photos/$counter');
// // //     var peredacha = ImageModel.fromJson(json.decode(response.body));
// // //     setState(() {
// // //       list.add(peredacha);
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Work with json',
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Click on btn to see magic'),
// // //         ),
// // //         body: Lists(list),
// // //         floatingActionButton: FloatingActionButton(
// // //           child: Text('Click!'),
// // //           onPressed: fetch,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1_from_course/src/models/image_model.dart';
// // import 'package:http/http.dart' show get;

// // import 'widgets/image_list.dart';

// // class App extends StatefulWidget {
// //   @override
// //   _AppState createState() => _AppState();
// // }

// // class _AppState extends State<App> {
// //   int counter = 0;
// //   final List<ImageModel> list = [];
// //   void addModel() async {
// //     counter++;
// //     var response =
// //         await get('https://jsonplaceholder.typicode.com/users/$counter');
// //     var peredacha = ImageModel.fromJson(json.decode(response.body));
// //     setState(() {
// //       list.add(peredacha);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('App bar'),
// //         ),
// //         body: ImageList(list),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: addModel,
// //           child: Icon(Icons.add),
// //         ),
// //         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1_from_course/src/models/image_model.dart';
// import 'package:http/http.dart';

// import 'widgets/image_list.dart';

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   int counter = 0;
//   List<ImageModel> list = [];
//   void fetch() async {
//     counter++;
//     var response =
//         await get('https://jsonplaceholder.typicode.com/photos/$counter');
//     var data = ImageModel.fromJson(json.decode(response.body));
//     setState(() {
//       list.add(data);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             return ImageList(list[index]);
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: fetch,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_from_course/src/models/image_model.dart';
import 'package:flutter_application_1_from_course/src/widgets/image_list.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<Model> list = [];
  void _fetch() async {
    counter++;
    var url = 'https://jsonplaceholder.typicode.com/comments/$counter';
    var response = await http.get(url);
    final data = Model.fromJson(json.decode(response.body));
    setState(() {
      list.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(list),
        floatingActionButton: FloatingActionButton(
          onPressed: _fetch,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
