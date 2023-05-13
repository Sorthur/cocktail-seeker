import 'package:flutter/material.dart';
import 'GUI/Home.dart';

void main() {
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