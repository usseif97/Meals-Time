import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final image;

  CategoryItem(this.id, this.title, this.color, this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Gesture Detector
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.75), BlendMode.dstATop),
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
