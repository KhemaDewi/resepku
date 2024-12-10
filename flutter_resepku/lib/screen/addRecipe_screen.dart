import 'package:flutter/material.dart';

class AddrecipeScreen extends StatelessWidget {
  const AddrecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddRecipe'),
      ),
      body: const Padding(
          padding: EdgeInsets.all(16), child: Text('Ini adalah halaman addRecipe')),
    );
  }
}