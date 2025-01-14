import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AddrecipeScreen extends StatelessWidget {
  const AddrecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
        actions: [
          TextButton(
            onPressed: () {
              // Save action
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
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
              Center( //TAMBAH FOTO
                child: GestureDetector(
                  onTap: () {
                    // Add photo action
                  },
                  child: Container(//MENAGTUR UKURAN DAN STYLE TAMBAH FOTO
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Title Field
              Row(//INPUT JUDUL RESEP
                children: [
                  const Icon(
                    Icons.note_alt_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: _buildInputDecoration(
                        'Title',
                        'Enter recipe title',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Category and Time Input
              Row(
                children: [
                  const Icon(
                    Icons.category_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: _buildInputDecoration(
                        'Category',
                        null,
                      ),
                      items: ['Main', 'Appetizer', 'Dessert', 'Drink']
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Category selection logic
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration(
                              'Hours',
                              null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration(
                              'Minutes',
                              null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Ingredients Section
              const Row(
                children: [
                  Icon(
                    Icons.restaurant_menu_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 5,
                decoration: _buildInputDecoration(
                  'Ingredients',
                  'List all ingredients',
                ),
              ),
              const SizedBox(height: 16),
              // How to Make Section
              const Row(
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'How to Make',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 5,
                decoration: _buildInputDecoration(
                  'How to Make',
                  'Describe the steps to make the recipe',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, String? hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: Colors.black26,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
