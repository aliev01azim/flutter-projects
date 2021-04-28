// import 'package:flutter/material.dart';

// import '../widgets/main_drawer.dart';
// import './favorites_screen.dart';
// import './categories_screen.dart';
// import '../models/meal.dart';

// class TabsScreen extends StatefulWidget {
//   final List<Meal> favoriteMeals;

//   TabsScreen(this.favoriteMeals);

//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   List<Map<String, Object>> _pages;
//   int _selectedPageIndex = 0;

//   @override
//   void initState() {
//     _pages = [
//       {
//         'page': CategoriesScreen(),
//         'title': 'Categories',
//       },
//       {
//         'page': FavoritesScreen(widget.favoriteMeals),
//         'title': 'Your Favorite',
//       },
//     ];
//     super.initState();
//   }

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_pages[_selectedPageIndex]['title']),
//       ),
//       drawer: MainDrawer(),
//       body: _pages[_selectedPageIndex]['page'],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectedPageIndex,
//         // type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.star),
//             label: 'Favorites',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  TabsScreen(this.favoriteList);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  List<Map<String, Object>> pages;
  @override
  void initState() {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteList),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_currentIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'favorites',
          ),
        ],
      ),
    );
  }
}
