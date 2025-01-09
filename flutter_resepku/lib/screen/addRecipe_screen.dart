import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddrecipeScreen extends StatelessWidget {
  const AddrecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    // untuk add photo
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
              SizedBox(height: 24),
              // Title Field
              Row(
                children: [
                  Icon(
                    Icons.note_alt_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: _buildInputDecoration('Title', 'Masukkan nama makanan', false),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Category and Time Row
              Row(
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: _buildInputDecoration('Category', null, false),
                      items: ['Main', 'Appetizer', 'Dessert', 'Drink']
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      onChanged: (value) {
                        //untuk category selection
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration('Hours', null, false),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration('Minutes', null, false),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Section Title for Ingredients
              Row(
                children: [
                  Icon(
                    Icons.restaurant_menu_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Recipe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Ingredients Field
              TextField(
                maxLines: 5,
                decoration: _buildInputDecoration('Ingredients', null, true).copyWith(
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 5,
                decoration: _buildInputDecoration('How to Make', null, true).copyWith(
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, String? hint, bool isMultiline) {
    return isMultiline
        ? InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: TextStyle(
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          )
        : InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 14,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          );
  }
}