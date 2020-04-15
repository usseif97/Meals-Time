import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final appBar = AppBar(
    title: const Text('DeliMeal'),
    elevation: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize
                  .height - // height of appBar, // height of StatusBar
              MediaQuery.of(context).padding.top) *
          0.8,
      child: ListView(
        children: DUMMY_CATEGORIES
            .map(
              (item) => CategoryItem(
                item.id,
                item.title,
                item.color,
                item.image,
              ),
            )
            .toList(),
        itemExtent: 200, //height of each item
      ),
    );
  }
}

/*GridView(
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                    catData.title,
                    catData.color,
                  ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),*/

/*SnackBar(
              content: Text('Welcome'),
            )*/

/*ListWheelScrollView(
          children: DUMMY_CATEGORIES
              .map(
                (item) => CategoryItem(
                  item.title,
                  item.color,
                  item.image,
                ),
              )
              .toList(),
          itemExtent: 200, //height of each item
          diameterRatio: 3, // the less the more 3d
        )*/
