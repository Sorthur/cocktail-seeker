import 'dart:async';

import 'package:cocktail_seeker/models/cocktail.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbRepository {
  // ctor database as a singleton?

  Future<Database> getDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'cocktail_seeker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cocktails(id TEXT PRIMARY KEY, name TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertCocktail(Cocktail cocktail) async {
    final db = await getDb();

    await db.insert(
      'cocktails',
      cocktail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }
}
