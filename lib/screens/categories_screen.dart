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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Container(
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
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            hoverColor: Colors.yellow,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
                size: 10,
                color: Colors.white,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 10,
                color: Colors.white,
              ),
              title: Text(''),
            )
          ],
        ),
      ),
      /*bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 20,
                color: Colors.red,
              ),
              title: Text(''),
            ),
          ],
        ),
      ),*/
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