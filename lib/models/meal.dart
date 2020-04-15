enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String complexity;
  final String categories;
  final String title;
  final String imageURL;
  final String ingredients;
  final String steps;
  final String duration;
  final String affordability;
  final String isGlutenFree;
  final String isLactoseFree;
  final String isVegan;
  final String isVegetarian;

  const Meal({
    this.id,
    this.categories,
    this.title,
    this.imageURL,
    this.ingredients,
    this.complexity,
    this.steps,
    this.duration,
    this.affordability,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
  });
}
