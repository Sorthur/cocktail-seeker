class Ingredient {
  String name;

  Ingredient({required this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['strIngredient1'],
    );
  }
}