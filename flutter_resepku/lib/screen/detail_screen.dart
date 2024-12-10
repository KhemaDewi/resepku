import 'package:flutter/material.dart';
import 'package:flutter_resepku/screen/home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required HomeScreen varHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: const Padding(
          padding: EdgeInsets.all(16), child: Text('Ini adalah halaman detail')),
    );
  }
}