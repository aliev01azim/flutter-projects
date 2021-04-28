// import 'package:flutter/material.dart';

// import '../dummy_data.dart';

// class MealDetailScreen extends StatelessWidget {
//   static const routeName = '/meal-detail';

//   final Function toggleFavorite;
//   final Function isFavorite;

//   MealDetailScreen(this.toggleFavorite, this.isFavorite);

//   Widget buildSectionTitle(BuildContext context, String text) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.headline6,
//       ),
//     );
//   }

//   Widget buildContainer(Widget child) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(10),
//       height: 150,
//       width: 300,
//       child: child,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mealId = ModalRoute.of(context).settings.arguments as String;
//     final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${selectedMeal.title}'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 selectedMeal.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             buildSectionTitle(context, 'Ingredients'),
//             buildContainer(
//               ListView.builder(
//                 itemBuilder: (ctx, index) => Card(
//                   color: Theme.of(context).accentColor,
//                   child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 5,
//                         horizontal: 10,
//                       ),
//                       child: Text(selectedMeal.ingredients[index])),
//                 ),
//                 itemCount: selectedMeal.ingredients.length,
//               ),
//             ),
//             buildSectionTitle(context, 'Steps'),
//             buildContainer(
//               ListView.builder(
//                 itemBuilder: (ctx, index) => Column(
//                   children: [
//                     ListTile(
//                       leading: CircleAvatar(
//                         child: Text('# ${(index + 1)}'),
//                       ),
//                       title: Text(
//                         selectedMeal.steps[index],
//                       ),
//                     ),
//                     Divider()
//                   ],
//                 ),
//                 itemCount: selectedMeal.steps.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           isFavorite(mealId) ? Icons.star : Icons.star_border,
//         ),
//         onPressed: () => toggleFavorite(mealId),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function selectFavorite;
  final Function isFavorite;
  MealDetailScreen(this.selectFavorite, this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere((element) => element.id == routeId);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              isFavorite(routeId) ? Icons.star : Icons.star_border,
            ),
            onPressed: () => selectFavorite(routeId),
          ),
        ],
        title: Text('detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image.network(
                mealData.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(child: Text('Ingridients')),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: mealData.ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(mealData.ingredients[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(child: Text('Steps')),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: mealData.steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(mealData.steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(routeId);
        },
      ),
    );
  }
}
