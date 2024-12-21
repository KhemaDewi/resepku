import 'package:flutter/material.dart';
import 'package:flutter_resepku/models/home.dart';
import 'package:flutter_resepku/screen/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Home varHome;
  const DetailScreen({super.key, required this.varHome});

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
                  varHome.gambar,
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
              Text(
                varHome.namaMakanan,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Info Lainnya
              SizedBox(height: 4),
              Text(
                varHome.nama,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.category, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text(
                        varHome.kategori,
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
                        varHome.waktu,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Recipe ⚒",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text("1. 1/4 tsp Body"),
              Text("2. 75 ml Since"),
              Text("3. 1 cups and"),
              Text("4. 2 post."),
              Text("5. 2 tsp question"),
              SizedBox(height: 16),
              Text(
                "How to Make",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text("1. Body text for a post."),
              Text("2. Since it's a social app, sometimes it's a hot take"),
              Text("3. and sometimes it's a question."),
              Text("4. Body text for a post."),
              Text("5. and sometimes it's a question."),
            ],
          ),
        ),
      ]),
    )));
  }
}
