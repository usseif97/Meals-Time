import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.black,
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          title: TextStyle(
            fontSize: 30,
            fontFamily: 'RobotoCondenesd',
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: AuthScreen(),
      /*isAuth():CategoriesScreen()?AuthScreen() ,*/
      routes: {
        '/tabs': (ctx) => TabScreen(),
        '/categories': (ctx) => CategoriesScreen(),
        '/category-meals': (ctx) => CategoryMealsScreen(),
        '/meal-detail': (ctx) => MealDetailScreen(),
        '/filters': (ctx) => FilterScreen(_setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoriesScreen()); // default intent for pushNamed
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoriesScreen()); // the Last Chance before throw an error for pushNamed
      },
    );
  }
}
