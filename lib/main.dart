import 'package:cocktail_seeker/models/cocktail.dart';
import 'package:cocktail_seeker/repositories/db_repository.dart';
import 'package:flutter/material.dart';
import 'GUI/Home.dart';

void main() async {
  final dbRepo = DbRepository();
  await dbRepo.getDb();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coctail Seeker',
      home: SafeArea(child: Home(title: 'Coctail Seeker Home Page')) ,
    );
  }
}