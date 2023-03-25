import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category.dart';

class CocktailRepository {
  final String apiUrl;
  T? cast<T>(x) => x is T ? x : null;

  CocktailRepository(this.apiUrl);

  Future<List<Category>> fetchDrinkCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['drinks'];

      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load drink categories');
    }
  }
}
