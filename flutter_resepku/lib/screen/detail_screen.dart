import 'package:flutter/material.dart';
import 'package:flutter_resepku/models/home.dart';

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
              const SizedBox(height: 16),
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
                    varHome.nama,
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
                    varHome.resep,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                    varHome.caraMasak,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
