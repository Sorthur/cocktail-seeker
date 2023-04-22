import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category_filter.dart';

class CocktailRepository {
  final String apiUrl;
  T? cast<T>(x) => x is T ? x : null;

  CocktailRepository(this.apiUrl);

  Future<List<CategoryFilter>> fetchDrinkCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['drinks'];

      return data.map((json) => CategoryFilter.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load drink categories');
    }
  }
}
