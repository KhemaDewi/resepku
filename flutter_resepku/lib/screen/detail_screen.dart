import 'package:flutter/material.dart';
import 'package:flutter_resepku/models/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final Home varHome;
  const DetailScreen({super.key, required this.varHome});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];
    setState(() {
      _isFavorite = favoriteHomes.contains(widget.varHome.nama);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];

    setState(() {
      if (_isFavorite) {
        favoriteHomes.remove(widget.varHome.nama);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${widget.varHome.nama} removed from favorites')));
      } else {
        favoriteHomes.add(widget.varHome.nama);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${widget.varHome.nama} added to favorites')));
      }
    });

    await prefs.setStringList('favoriteHomes', favoriteHomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        // -------------------- Atas --------------------
        Stack(
          children: [
            // Image Utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.varHome.gambar,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            // Tombol Back
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            )
          ],
        ),
        const SizedBox(height: 16),
        // Dibawah Image Utama
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Judul
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.varHome.namaMakanan,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: _toggleFavorite,
                    icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border),
                    color: _isFavorite ? Colors.red : null,
                  )
                ],
              ),
              const SizedBox(height: 2),
              // Info Lainnya
              Row(
                children: [
                  SizedBox(width: 4),
                  Text(
                    "oleh",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    widget.varHome.nama,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu_book_rounded, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text(
                        widget.varHome.kategori,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text(
                        widget.varHome.waktu,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 16),
                ],
              ),
              // Garis Pembatas
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
              Row(
                children: [
                  SizedBox(height: 16),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Recipe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.restaurant, color: Colors.grey[600]),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 8),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.varHome.resep,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. 1/4 tsp Body", textAlign: TextAlign.justify),
                      SizedBox(height: 8),
                      Text("2. 75 ml Since", textAlign: TextAlign.justify),
                      SizedBox(height: 8),
                      Text("3. 1 cups and", textAlign: TextAlign.justify),
                      SizedBox(height: 8),
                      Text("4. 2 post.", textAlign: TextAlign.justify),
                      SizedBox(height: 8),
                      Text("5. 2 tsp question", textAlign: TextAlign.justify),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 8),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.varHome.caraMasak,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. Body text for a post.",
                            textAlign: TextAlign.justify),
                        SizedBox(height: 8),
                        Text(
                            "2. Since it's a social app, sometimes it's a hot take",
                            textAlign: TextAlign.justify),
                        SizedBox(height: 8),
                        Text("3. and sometimes it's a question.",
                            textAlign: TextAlign.justify),
                        SizedBox(height: 8),
                        Text("4. Body text for a post.",
                            textAlign: TextAlign.justify),
                        SizedBox(height: 8),
                        Text("5. and sometimes it's a question.",
                            textAlign: TextAlign.justify),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
