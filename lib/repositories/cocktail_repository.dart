import 'dart:convert';

import 'package:cocktail_seeker/configuration/api_constants.dart';
import 'package:cocktail_seeker/models/cocktail.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/filters/alcoholic_filter.dart';
import '../models/filters/category_filter.dart';
import '../models/filters/filter.dart';
import '../models/filters/glass_filter.dart';
import '../models/filters/ingredient_filter.dart';

class CocktailRepository {
  Future<List<Cocktail>> getCocktailsByFilter(Filter filter) async {
    var endpoint = _getEndpointByFilterType(filter);
    final response = await http
        .get(Uri.parse('${ApiConstants.baseUrl}/$endpoint${filter.name}'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['drinks'];
      return data.map((json) => Cocktail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  String _getEndpointByFilterType(Filter filter) {
    switch (filter.runtimeType) {
      case AlcoholicFilter:
        return ApiConstants.cocktailByAlcoholicEndpoint;
      case CategoryFilter:
        return ApiConstants.cocktailByCategoryEndpoint;
      case GlassFilter:
        return ApiConstants.cocktailByGlassEndpoint;
      case IngredientFilter:
        return ApiConstants.cocktailByIngredientEndpoint;
      default:
        throw Exception('Filter type not recognized');
    }
  }

  Future<Cocktail> getCocktailsById(int id) async =>
      throw Exception('Not implemented');
}
