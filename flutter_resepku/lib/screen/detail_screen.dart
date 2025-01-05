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
          child: Column(
            children: [
              // -------------------- Atas --------------------
              Stack(
                children: [
                  // Image Utama
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle
                    ),
                    child: IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.arrow_back)),
                  )
                ],
              ),
              // Dibawah Image Utama
              Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Judul
                  Text(
                    varHome.namaMakanan,
                    style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Info Lainnya
                  
                ],
              ),
              )

              // -------------------- Bawah --------------------
            ],
          ),
        ))
    );
  }
}