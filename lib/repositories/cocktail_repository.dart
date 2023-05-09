import 'package:cocktail_seeker/models/cocktail.dart';
import 'package:http/http.dart' as http;

import '../models/filters/filter.dart';

class CocktailRepository {
  Future<List<Cocktail>> getCocktailsByFilter(Filter filter) async =>
      throw Exception('Not implemented');
  Future<Cocktail> getCocktailsById(int id) async =>
      throw Exception('Not implemented');
}
