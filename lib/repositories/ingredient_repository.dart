import 'dart:convert';
import 'package:cocktail_seeker/configuration/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/detailed_ingredient.dart';

class IngredientRepository {
  Future<DetailedIngredient> getIngredientById(int id) async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}/${ApiConstants.ingredientEndpointById}$id'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['ingredients'];
      return data.map((json) => DetailedIngredient.fromJson(json)).first;
    } else {
      throw Exception('Failed to load detailed cocktail');
    }
  }

  Future<DetailedIngredient> getIngredientByName(String name) async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}/${ApiConstants.ingredientEndpointsByName}$name'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['ingredients'];
      return data.map((json) => DetailedIngredient.fromJson(json)).first;
    } else {
      throw Exception('Failed to load detailed cocktail');
    }
  }
}
