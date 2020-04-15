import 'package:flutter/material.dart';
import '../widgets/categories_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFiltersHandler;
  FilterScreen(this.saveFiltersHandler);

  @override
  _FilterScreen createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetrian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Filters',
          ),
          /*actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: widget.saveFiltersHandler,
            ),
          ],*/
        ),
        drawer: CategoriesDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust Your Meal !',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColorDark),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten Free',
                      'Only Include Gluten Free Meals',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose Free',
                      'Only Include Lactose Free Meals',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegetrian', 'Only Include Vegetrian Meals', _vegetrian,
                      (newValue) {
                    setState(() {
                      _vegetrian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only Include Vegan Meals', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
