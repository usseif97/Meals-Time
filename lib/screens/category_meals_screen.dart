import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs['title'],
        ),
      ),
      body: Center(
        child: Text(
          'Recipes',
        ),
      ),
    );
  }
}
