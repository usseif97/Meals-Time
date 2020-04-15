import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSection(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        titleText,
        style:
            TextStyle(fontSize: 20, color: Theme.of(context).primaryColorDark),
      ),
    );
  }

  Widget buildSectionContaineer(
      BuildContext context, double width, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 200,
      width: width,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tempMeal = ModalRoute.of(context).settings.arguments as Meal;
    print(tempMeal.title);

    String ingredients = tempMeal.ingredients;
    ingredients = ingredients.substring(1, ingredients.length - 1);
    List<String> ingredientsList = ingredients.split(',');

    String steps = tempMeal.steps;
    steps = steps.substring(1, steps.length - 1);
    List<String> stepsList = steps.split(',');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${tempMeal.title}',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Image.network(
                  tempMeal.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              buildSection(context, 'INGRIDENTS'),
              buildSectionContaineer(
                context,
                200,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(ingredientsList[index]),
                      ),
                    );
                  },
                  itemCount: ingredientsList.length,
                ),
              ),
              buildSection(context, 'STEPS'),
              buildSectionContaineer(
                context,
                300,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(stepsList[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: ingredientsList.length,
                ),
              ),
            ],
          ),
        ));
  }
}
