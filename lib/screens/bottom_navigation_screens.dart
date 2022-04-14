import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynuu/screens/main/homepage.dart';
import 'package:mynuu/screens/search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'favourites_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final _screens = [
    Homepage(),
    SearchScreen(),
    FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Colors.amber,
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Image.asset("assets/icons/home.png", width: 20, height: 20),
            title: Text("Home"),
            selectedColor: Colors.white54,
            unselectedColor: Colors.white54,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Image.asset(
              "assets/icons/search.png",
              width: 20,
              height: 20,
            ),
            title: Text("Search"),
            selectedColor: Colors.white54,
            unselectedColor: Colors.white54,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Image.asset("assets/icons/heart.png", width: 20, height: 20),
            title: Text("Favorites", style: TextStyle(color: Colors.white54)),
            selectedColor: Colors.white54,
            unselectedColor: Colors.white54,
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
