import 'package:flutter/material.dart';
import 'package:flutter_resepku/screen/addRecipe_screen.dart';
import 'package:flutter_resepku/screen/editprofil_screen.dart';
import 'package:flutter_resepku/screen/favorite_screen.dart';
import 'package:flutter_resepku/screen/home_screen.dart';
import 'package:flutter_resepku/screen/profile_screen.dart';
import 'package:flutter_resepku/screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _ScreenOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const AddrecipeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
    const EditprofilScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ScreenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          //item pertama
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //item kedua
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          //item ketiga
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Add Recipe'),
          //item keempat
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          //item kelima
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.shade200,
      ),
    );
  }
}