class Cocktail {
  String name;
  String image;
  int id;

  Cocktail({
    required this.name,
    required this.image,
    required this.id,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      image: json['strDrinkThumb'],
      id: json['idDrink'],
    );
  }
}
