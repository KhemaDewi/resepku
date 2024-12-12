import 'package:flutter/material.dart';
import 'package:flutter_resepku/data/home_data.dart';
import 'package:flutter_resepku/models/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              Icons.restaurant_sharp, // Ikon jam
              size: 22, // Ukuran ikon
              color: Colors.black, // Warna ikon, bisa disesuaikan
            ),
          ),
          leadingWidth: 15,
          title: const Text('Resepku'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // ----------------------- ATAS -----------------------
              Stack(
              children: [
                // Image Utama
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset('images/utama.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                ),
              ],
            ),
              // Dibawahnya Image Utama
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                padding: const EdgeInsets.all(8),
                itemCount: homeList.length,
                itemBuilder: (context, index) {
                  Home varHome = homeList[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.all(6),
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //Gambar
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              varHome.gambar,
                              fit: BoxFit.cover,
                            ),
                          )),
                          //Nama Makanan
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              varHome.namaMakanan,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //Ikon Waktu
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Mengatur jarak antar elemen
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_alarm, // Ikon jam
                                      size: 20, // Ukuran ikon
                                      color: Colors.grey, // Warna ikon
                                    ),
                                    const SizedBox(
                                        width: 4), // Jarak antara ikon dan teks
                                    Text(
                                      varHome.waktu,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.favorite_border, // Ikon love
                                    size: 24, // Ukuran ikon
                                    color: Colors
                                        .grey, // Warna ikon, bisa disesuaikan
                                  ),
                                  onPressed: () {
                                    // Tambahkan logika untuk aksi tombol
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              )
            ],
          ),
        )));
  }
}
