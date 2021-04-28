// import 'package:flutter/material.dart';

// import '../widgets/meal_item.dart';
// import '../models/meal.dart';

// class CategoryMealsScreen extends StatefulWidget {
//e = '/category-meals';

//   final List<Meal> availableMeals;

//   CategoryMealsScreen(this.availableMeals);

//   @override
//   _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
// }

// class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
//   String categoryTitle;
//   List<Meal> displayedMeals;
//   var _loadedInitData = false;

//   @override
//   void initState() {
//     // ...
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (!_loadedInitData) {
//       final routeArgs =
//           ModalRoute.of(context).settings.arguments as Map<String, String>;
//       categoryTitle = routeArgs['title'];
//       final categoryId = routeArgs['id'];
//       displayedMeals = widget.availableMeals.where((meal) {
//         return meal.categories.contains(categoryId);
//       }).toList();
//       _loadedInitData = true;
//     }
//     super.didChangeDependencies();
//   }

//   void _removeMeal(String mealId) {
//     setState(() {
//       displayedMeals.removeWhere((meal) => meal.id == mealId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             id: displayedMeals[index].id,
//             title: displayedMeals[index].title,
//             imageUrl: displayedMeals[index].imageUrl,
//             duration: displayedMeals[index].duration,
//             affordability: displayedMeals[index].affordability,
//             complexity: displayedMeals[index].complexity,
//           );
//         },
//         itemCount: displayedMeals.length,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals-screen';
  final List<Meal> switchedList;
  CategoryMealsScreen(this.switchedList);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> newList;
  bool isTrue = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isTrue) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final id = routeArgs['id'];
      newList = widget.switchedList
          .where((meal) => meal.categories.contains(id))
          .toList();
      isTrue = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(String id) {
    setState(() {
      newList.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: newList.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: newList[index].id,
            title: newList[index].title,
            affordability: newList[index].affordability,
            complexity: newList[index].complexity,
            imageUrl: newList[index].imageUrl,
            duration: newList[index].duration,
            removeItem: removeItem,
          );
        },
      ),
    );
  }
}
