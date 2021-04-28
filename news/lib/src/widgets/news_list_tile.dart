import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/models/item_model.dart';

import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;
  NewsListTile({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }
            return buildTile(context, itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context, ItemModel item) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/${item.id}');
          },
          title: Text(item.title),
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text("${item.descendants}"),
            ],
          ),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }
}
// asdasdasdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../models/item_model.dart';
// import '../blocs/stories_provider.dart';

// class NewsListTile extends StatelessWidget {
//   final int id;

//   NewsListTile({this.id});

//   Widget build(context) {
//     final bloc = StoriesProvider.of(context);

//     return StreamBuilder(
//       stream: bloc.items,
//       builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
//         if (!snapshot.hasData) {
//           return Text('Stream still loading');
//         }

//         return FutureBuilder(
//           future: snapshot.data[id],
//           builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
//             if (!itemSnapshot.hasData) {
//               return Text('Still loading item $id');
//             }

//             return buildTile(itemSnapshot.data);
//           },
//         );
//       },
//     );
//   }

//   Widget buildTile(ItemModel item) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text(item.title),
//           subtitle: Text('${item.score} points'),
//           trailing: Column(
//             children: [
//               Icon(Icons.comment),
//               Text('${item.descendants}'),
//             ],
//           ),
//         ),
//         Divider(
//           height: 8.0,
//         ),
//       ],
//     );
//   }
// }
