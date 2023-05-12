import 'package:flutter/material.dart';
import 'Options.dart';
import 'Search.dart';
import 'Favorites.dart';

class Home extends StatefulWidget {
  const Home({super.key, required title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 int selectedIndex = 0;
 final screens = [
  Search(),
  Favorites(),
  Options(),
 ];

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: screens[selectedIndex],
   backgroundColor: const Color(0xffffffff),
   bottomNavigationBar: BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: (index) {
     setState(() {
      selectedIndex = index;
     });
    },
    items: const <BottomNavigationBarItem>[
     BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
     ),
     BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
     ),
     BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Options',
     ),
    ],
    backgroundColor: Color(0xff888888),
    elevation: 8,
    iconSize: 25,
    selectedItemColor: Color(0xff3a57e8),
    unselectedItemColor: Color(0xffffffff),
    selectedFontSize: 14,
    unselectedFontSize: 14,
    showSelectedLabels: true,
    showUnselectedLabels: false,
   ),
  );
 }
}
