import 'package:flutter/material.dart';
import 'package:flutter_resepku/data/home_data.dart';
import 'package:flutter_resepku/models/home.dart';
import 'package:flutter_resepku/screen/detail_screen.dart';
import 'package:flutter_resepku/screen/favorite_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Now"; // Kategori yang dipilih secara default
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

  /// Menambahkan atau menghapus makanan dari favorit
  Future<void> _toggleFavorite(Home varHome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (favoriteHomes.contains(varHome.namaMakanan)) {
        favoriteHomes.remove(varHome.namaMakanan);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${varHome.namaMakanan} dihapus dari favorit'),
        ));
      } else {
        favoriteHomes.add(varHome.namaMakanan);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${varHome.namaMakanan} ditambahkan ke favorit'),
        ));
      }
    });
    await prefs.setStringList('favoriteHomes', favoriteHomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(
            Icons.restaurant_sharp,
            size: 22,
            color: Colors.black,
          ),
        ),
        leadingWidth: 15,
        title: const Text('Resepku'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ----------------------- Gambar Utama -----------------------
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'images/utama.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              ),
              // ----------------------- ChoiceChips -----------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0, // Jarak antar ChoiceChip
                  children: [
                    _buildChoiceChip("MainCourse"),
                    _buildChoiceChip("Appetizer"),
                    _buildChoiceChip("Dessert"),
                    _buildChoiceChip("Drink"),
                    _buildChoiceChip("Now"),
                  ],
                ),
              ),
              // ----------------------- GridView -----------------------
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                padding: const EdgeInsets.all(8),
                itemCount: homeList.length,
                itemBuilder: (context, index) {
                  Home varHome = homeList[index];
                  bool isFavorite = favoriteHomes.contains(varHome.namaMakanan);
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(varHome: varHome),
                        ),
                      );
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.all(6),
                        elevation: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Gambar
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  varHome.gambar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Nama Makanan
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 8),
                              child: Text(
                                varHome.namaMakanan,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Ikon Waktu
                            Padding(
                              padding: const EdgeInsets.only(left: 16, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_alarm,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        varHome.waktu,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    color: isFavorite ? Colors.red : null,
                                    onPressed: () {
                                      _toggleFavorite(varHome);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk ChoiceChip
  Widget _buildChoiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedCategory == label,
      onSelected: (isSelected) {
        setState(() {
          selectedCategory = label;
        });
      },
      selectedColor: Colors.blueAccent, // Warna saat terpilih
      backgroundColor: Colors.grey[200], // Warna saat tidak terpilih
      labelStyle: TextStyle(
          color: selectedCategory == label ? Colors.white : Colors.black),
    );
  }
}
