import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddrecipeScreen extends StatelessWidget {
  const AddrecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddRecipe'),
        actions: [
          TextButton(onPressed: () {},
           child: Text(
            'Save',
            style:TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    // untuk aadd photo
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Masukkan Nama Makanan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Main','Appetizer','Dessert','Drink'].map((Category) => DropdownMenuItem(
                      value:Category,child: Text(Category),
                    ))
                    .toList(),
                    onChanged: (value) {
                      //untuk catgeory selection
                    },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Row(
                    children: [
                      Expanded(child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const  InputDecoration(
                          labelText: 'Hours',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Minutes',
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Ingredient',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'How to Make',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ],
           ),
           ),
           ),
    );
  }
}