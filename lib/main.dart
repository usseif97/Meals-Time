import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        home: AuthScreen(),  /*isAuth():CategoriesScreen()?AuthScreen() ,*/
        routes: {
          '/categories': (ctx) => CategoriesScreen(),
          '/category-meals': (ctx) => CategoryMealsScreen(),
        });
  }
}
