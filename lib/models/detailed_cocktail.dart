class DetailedCocktail {
  String id;
  String name;
  String? alternateName;
  String? tags;
  String? video;
  String? category;
  String? alcoholic;
  String? glass;
  String? instructions;
  String? thumbUrl;
  String? imageSource;
  String? creativeCommonsConfirmed;
  DateTime dateModified;
  List<String> ingredients;
  List<String> measures;

  DetailedCocktail({
    required this.id,
    required this.name,
    required this.alternateName,
    required this.tags,
    required this.video,
    required this.category,
    required this.alcoholic,
    required this.glass,
    required this.instructions,
    required this.thumbUrl,
    required this.imageSource,
    required this.creativeCommonsConfirmed,
    required this.dateModified,
    required this.ingredients,
    required this.measures,
  });

  factory DetailedCocktail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 15; i++) {
      String? ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      } else {
        break;
      }
    }

    for (int i = 1; i <= 15; i++) {
      String? measure = json['strMeasure$i'];
      if (measure != null && measure.isNotEmpty) {
        measures.add(measure);
      } else {
        break;
      }
    }

    return DetailedCocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      alternateName: json['strDrinkAlternate'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glass: json['strGlass'],
      instructions: json['strInstructions'],
      thumbUrl: json['strDrinkThumb'],
      tags: json['strTags'],
      creativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: DateTime.parse(json['dateModified']),
      imageSource: json['strImageSource'],
      video: json['strVideo'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  @override
  String toString() {
    String ingredientsStr = ingredients.join(', ');
    return 'id: $id \nname: $name \ningredients: $ingredientsStr';
  }
}
