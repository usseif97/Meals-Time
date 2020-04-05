enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Affordability afford;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    this.id,
    this.categories,
    this.title,
    this.imageURL,
    this.ingredients,
    this.steps,
    this.duration,
    this.afford,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
  });
}
