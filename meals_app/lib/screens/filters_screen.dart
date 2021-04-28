// import 'package:flutter/material.dart';

// import '../widgets/main_drawer.dart';

// class FiltersScreen extends StatefulWidget {
//   static const routeName = '/filters';

//   final Function saveFilters;
//   final Map<String, bool> currentFilters;

//   FiltersScreen(this.currentFilters, this.saveFilters);

//   @override
//   _FiltersScreenState createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends State<FiltersScreen> {
//   bool _glutenFree = false;
//   bool _vegetarian = false;
//   bool _vegan = false;
//   bool _lactoseFree = false;

//   @override
//   initState() {
//     _glutenFree = widget.currentFilters['gluten'];
//     _lactoseFree = widget.currentFilters['lactose'];
//     _vegetarian = widget.currentFilters['vegetarian'];
//     _vegan = widget.currentFilters['vegan'];
//     super.initState();
//   }

//   Widget _buildSwitchListTile(
//     String title,
//     String description,
//     bool currentValue,
//     Function updateValue,
//   ) {
//     return SwitchListTile(
//       title: Text(title),
//       value: currentValue,
//       subtitle: Text(
//         description,
//       ),
//       onChanged: updateValue,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Filters'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               final selectedFilters = {
//                 'gluten': _glutenFree,
//                 'lactose': _lactoseFree,
//                 'vegan': _vegan,
//                 'vegetarian': _vegetarian,
//               };
//               widget.saveFilters(selectedFilters);
//             },
//           )
//         ],
//       ),
//       drawer: MainDrawer(),
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(20),
//             child: Text(
//               'Adjust your meal selection.',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 _buildSwitchListTile(
//                   'Gluten-free',
//                   'Only include gluten-free meals.',
//                   _glutenFree,
//                   (newValue) {
//                     setState(
//                       () {
//                         _glutenFree = newValue;
//                       },
//                     );
//                   },
//                 ),
//                 _buildSwitchListTile(
//                   'Lactose-free',
//                   'Only include lactose-free meals.',
//                   _lactoseFree,
//                   (newValue) {
//                     setState(
//                       () {
//                         _lactoseFree = newValue;
//                       },
//                     );
//                   },
//                 ),
//                 _buildSwitchListTile(
//                   'Vegetarian',
//                   'Only include vegetarian meals.',
//                   _vegetarian,
//                   (newValue) {
//                     setState(
//                       () {
//                         _vegetarian = newValue;
//                       },
//                     );
//                   },
//                 ),
//                 _buildSwitchListTile(
//                   'Vegan',
//                   'Only include vegan meals.',
//                   _vegan,
//                   (newValue) {
//                     setState(
//                       () {
//                         _vegan = newValue;
//                       },
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function switchList;
  final Map<String, bool> switches;
  FiltersScreen(this.switchList, this.switches);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluten = false;
  bool _lactose = false;
  bool _vegetarian = false;
  bool _vegan = false;
  @override
  void initState() {
    _gluten = widget.switches['gluten'];
    _lactose = widget.switches['lactose'];
    _vegetarian = widget.switches['vegetarian'];
    _vegan = widget.switches['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filtersScreen'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final switches = {
                  'gluten': _gluten,
                  'lactose': _lactose,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.switchList(switches);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluten,
            title: Text('Gluten'),
            onChanged: (val) {
              setState(() {
                _gluten = val;
              });
            },
          ),
          SwitchListTile(
            value: _lactose,
            title: Text('Lactose'),
            onChanged: (val) {
              setState(() {
                _lactose = val;
              });
            },
          ),
          SwitchListTile(
            value: _vegetarian,
            title: Text('Vegetarian'),
            onChanged: (val) {
              setState(() {
                _vegetarian = val;
              });
            },
          ),
          SwitchListTile(
            value: _vegan,
            title: Text('Vegan'),
            onChanged: (val) {
              setState(() {
                _vegan = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
