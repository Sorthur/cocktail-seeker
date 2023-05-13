class DetailedIngredient {
  String id;
  String name;
  String description;
  String type;
  String alcohol;
  String? abv;

  DetailedIngredient({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.alcohol,
    required this.abv,
  });

  factory DetailedIngredient.fromJson(Map<String, dynamic> json) {
    return DetailedIngredient(
      id: json['idIngredient'],
      name: json['strIngredient'],
      description: json['strDescription'],
      type: json['strType'],
      alcohol: json['strAlcohol'],
      abv: json['strABV'],
    );
  }

  @override
  String toString() {
    return 'id: $id \nname: $name';
  }
}
