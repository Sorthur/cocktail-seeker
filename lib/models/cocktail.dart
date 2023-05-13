class Cocktail {
  String id;
  String name;
  String image;

  Cocktail({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      image: json['strDrinkThumb'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Cocktail{id: $id, name: $name, image: $image}';
  }
}
