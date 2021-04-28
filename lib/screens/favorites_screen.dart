// import 'package:flutter/material.dart';

// import '../models/meal.dart';
// import '../widgets/meal_item.dart';

// class FavoritesScreen extends StatelessWidget {
//   final List<Meal> favoriteMeals;

//   FavoritesScreen(this.favoriteMeals);

//   @override
//   Widget build(BuildContext context) {
//     if (favoriteMeals.isEmpty) {
//       return Center(
//         child: Text('You have no favorites yet - start adding some!'),
//       );
//     } else {
//       return ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             id: favoriteMeals[index].id,
//             title: favoriteMeals[index].title,
//             imageUrl: favoriteMeals[index].imageUrl,
//             duration: favoriteMeals[index].duration,
//             affordability: favoriteMeals[index].affordability,
//             complexity: favoriteMeals[index].complexity,
//           );
//         },
//         itemCount: favoriteMeals.length,
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  FavoritesScreen(this.favoriteList);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.favoriteList.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favoriteList[index].id,
            title: widget.favoriteList[index].title,
            affordability: widget.favoriteList[index].affordability,
            complexity: widget.favoriteList[index].complexity,
            imageUrl: widget.favoriteList[index].imageUrl,
            duration: widget.favoriteList[index].duration,
          );
        },
      ),
    );
  }
}
