// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1_from_course/src/models/image_model.dart';

// // class Lists extends StatelessWidget {
// //   final List<ImageModel> list;
// //   Lists(this.list);
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: list.length,
// //       itemBuilder: (context, int index) {
// //         return Itog(list[index]);
// //       },
// //     );
// //   }

// //   Widget Itog(ImageModel length) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(
// //             color: Colors.black26, width: 1.0, style: BorderStyle.solid),
// //       ),
// //       child: Column(
// //         children: [
// //           Image.network(length.url),
// //           Text(length.title),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1_from_course/src/models/image_model.dart';

// class ImageList extends StatelessWidget {
//   final List<ImageModel> list;
//   ImageList(this.list);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         return itog(list[index]);
//       },
//     );
//   }

//   Widget itog(ImageModel data) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: Colors.black26, width: 1.0, style: BorderStyle.solid),
//       ),
//       child: Column(
//         children: [
//           Text(data.name),
//           Text(data.username),
//           Text(data.address.city),
//           Text(data.address.geo.lat)
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1_from_course/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<Model> list;
  ImageList(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(list[index].name),
              subtitle: Text(list[index].body),
              trailing: Text(list[index].email),
            ));
  }
}
