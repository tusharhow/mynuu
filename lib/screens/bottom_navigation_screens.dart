import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynuu/screens/main/homepage.dart';
import 'package:mynuu/screens/search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'favourites_screen.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  int _selectedIndex = 0;

  final screens = [
    Homepage(),
    SearchScreen(),
    FavouriteScreen(),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        // key: scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    color: Colors.white54,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/search.png"),
                  ),
                  label: 'Search',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/heart.png"),
                  ),
                  label: 'Favorites',
                  backgroundColor: Colors.transparent),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white54,
            unselectedItemColor: Colors.white38,
            iconSize: 40,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            elevation: 5),
        body: screens[_selectedIndex]);
  }
}
