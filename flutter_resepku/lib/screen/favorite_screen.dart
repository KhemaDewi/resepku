import 'package:flutter/material.dart';
import 'package:flutter_resepku/data/home_data.dart';
import 'package:flutter_resepku/models/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_screen.dart'; // Import DetailScreen

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoriteHomes = []; // Daftar nama makanan favorit

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  /// Memuat status favorit dari SharedPreferences
  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter daftar makanan favorit dari homeList
    List<Home> favoriteItems = homeList
        .where((home) => favoriteHomes.contains(home.namaMakanan))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          Home varHome = favoriteItems[index];
          return ListTile(
            leading: Image.asset(
              varHome.gambar,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(varHome.namaMakanan),
            subtitle: Text(varHome.waktu),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              // Navigasi ke DetailScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(varHome: varHome),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
