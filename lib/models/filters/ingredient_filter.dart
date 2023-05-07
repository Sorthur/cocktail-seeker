// ignore_for_file: overridden_fields

import 'package:cocktail_seeker/models/filters/filter.dart';

class IngredientFilter extends Filter {
  @override
  String name;

  IngredientFilter({required this.name});

  factory IngredientFilter.fromJson(Map<String, dynamic> json) {
    return IngredientFilter(
      name: json['strIngredient1'],
    );
  }
}
