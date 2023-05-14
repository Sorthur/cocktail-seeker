import 'dart:async';

import 'package:cocktail_seeker/models/filters/alcoholic_filter.dart';
import 'package:cocktail_seeker/models/filters/filter.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../models/favourite_query.dart';
import '../models/filters/category_filter.dart';
import '../models/filters/glass_filter.dart';
import '../models/filters/ingredient_filter.dart';

class DbRepository {
  // ctor database as a singleton?
  final tableName = 'favouritequeries';

  Future<Database> getDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'cocktail_seeker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY, filterType TEXT, filterName TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertFavouriteQuery(Filter filter) async {
    final db = await getDb();

    var values = _transformToFavouriteQueryMap(filter);
    debugPrint(values.toString());

    await db.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Map<String, dynamic> _transformToFavouriteQueryMap(Filter filter) {
    return {
      'id': Uuid().v1(),
      'filterType': filter.runtimeType.toString(),
      'filterName': filter.name,
    };
  }

  Future<List<FavouriteQuery>> getFavouriteQueries() async {
    final db = await getDb();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return FavouriteQuery(
          id: maps[i]['id'],
          filterType: maps[i]['filterType'],
          filterName: maps[i]['filterName'],
          filter: _buildFilter(maps[i]['filterType'], maps[i]['filterName']));
    });
  }

  Future<bool> favouriteQueryExists(Filter filter) async {
    final db = await getDb();

    final result = await db.query(
      tableName,
      where: "filterType = ? AND filterName = ?",
      whereArgs: [filter.runtimeType.toString(), filter.name],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  Filter _buildFilter(String filterType, String filterName) {
    switch (filterType) {
      case 'AlcoholicFilter':
        return AlcoholicFilter(name: filterName);
      case 'CategoryFilter':
        return CategoryFilter(name: filterName);
      case 'GlassFilter':
        return GlassFilter(name: filterName);
      case 'IngredientFilter':
        return IngredientFilter(name: filterName);
      default:
        throw Exception('Filter could not be build. $filterType | $filterName');
    }
  }

  Future removeById(String id) async {
    final db = await getDb();

    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
