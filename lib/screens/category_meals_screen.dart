import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  List<Meal> mLists = [];
  String id;

  void setID(String x) {
    id = x;
  }

  @override
  void initState() {
    super.initState();

    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('meals').once().then((DataSnapshot snap) {
      Map<dynamic, dynamic> map = Map.from(snap.value);
      map.forEach((key, value) {
        Map<dynamic, dynamic> mealMap = Map.from(value);
        List<dynamic> keysList = mealMap.keys.toList();
        List<dynamic> valuesList = mealMap.values.toList();

        var categ = valuesList[keysList.indexOf('categories')].toString();

        if (categ.contains('\'${id}\'')) {
          if (!mounted) return;
          setState(() {
            Meal m = new Meal(
              categories: valuesList[keysList.indexOf('categories')],
              duration: valuesList[keysList.indexOf('duration')],
              imageURL: valuesList[keysList.indexOf('imageUrl')],
              ingredients: valuesList[keysList.indexOf('ingredients')],
              isGlutenFree: valuesList[keysList.indexOf('isGlutenFree')],
              isLactoseFree: valuesList[keysList.indexOf('isLactoseFree')],
              isVegan: valuesList[keysList.indexOf('isVegan')],
              isVegetarian: valuesList[keysList.indexOf('isVegetarian')],
              steps: valuesList[keysList.indexOf('steps')],
              title: valuesList[keysList.indexOf('title')],
              affordability: valuesList[keysList.indexOf('affordability')],
              complexity: valuesList[keysList.indexOf('complexity')],
            );
            mLists.add(m);
          });
        } else {
          if (!mounted) return;
        }
      });
      //print('Size (InitState): ${mLists.length}');
    });
  }

  @override
  void didChangeDependencies() {
    // Called when the widget that belong to the State is fully initailzed so ModalRoute can be used on it,
    // Also run before Build() and After initState()
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    setID(categoryId.toString());
    //print('Id(Build): ${id}');
    //print('categoryId(Build): ${categoryId.toString()}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mLists[index],
          );
        },
        itemCount: mLists.length,
      ),
    );
  }
}
