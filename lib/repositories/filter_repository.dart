import 'dart:convert';
import 'package:cocktail_seeker/configuration/api_constants.dart';
import 'package:cocktail_seeker/models/filters/category_filter.dart';
import 'package:cocktail_seeker/models/filters/glass_filter.dart';
import 'package:cocktail_seeker/models/filters/ingredient_filter.dart';
import 'package:http/http.dart' as http;
import '../models/filters/alcoholic_filter.dart';
import '../models/filters/filter.dart';

class FilterRepository {
  Future<List<AlcoholicFilter>> getAlcoholicFilter() async {
    return _getFilter<AlcoholicFilter>(ApiConstants.alcoholicListEndpoint);
  }

  Future<List<CategoryFilter>> getCategoryFilter() async {
    return _getFilter<CategoryFilter>(ApiConstants.categoryListEndpoint);
  }

  Future<List<GlassFilter>> getGlassFilter() async {
    return _getFilter<GlassFilter>(ApiConstants.glassListEndpoint);
  }

  Future<List<IngredientFilter>> getIngredientFilter() async {
    return _getFilter<IngredientFilter>(ApiConstants.ingredientListEndpoint);
  }

  Future<List<T>> _getFilter<T extends Filter>(String filterEndpoint) async {
    final response =
        await http.get(Uri.parse(ApiConstants.baseUrl + filterEndpoint));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['drinks'];
      List<Filter> filters = [];
      switch (T) {
        case AlcoholicFilter:
          filters = data.map((json) => AlcoholicFilter.fromJson(json)).toList();
          break;
        case CategoryFilter:
          filters = data.map((json) => CategoryFilter.fromJson(json)).toList();
          break;
        case GlassFilter:
          filters = data.map((json) => GlassFilter.fromJson(json)).toList();
          break;
        case IngredientFilter:
          filters =
              data.map((json) => IngredientFilter.fromJson(json)).toList();
          break;
      }
      return filters as List<T>;
    } else {
      throw Exception('Failed to load filters');
    }
  }
}
