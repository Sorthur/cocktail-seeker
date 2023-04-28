class DetailedIngredient {
  Int id;
  String name;
  String decsription;
  String type;
  String alcohol;
  String abv;

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
      decsription: json['strDescription'],
      type: json['strType'],
      alcohol: json['strAlcohol'],
      abv: json['strABV'],
    );
  }
}