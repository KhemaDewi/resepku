import 'package:flutter/material.dart';
import 'package:flutter_resepku/data/user_data.dart';
import 'package:flutter_resepku/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: 1. LOGO APLIKASI
              SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/logo.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // TODO: 2. TEXTFIELD USERNAME,EMAIL DAN PASSWORD
              const SizedBox(height: 16),
              //Textfield untuk username
              TextField(
              controller: _usernameController,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(), labelText: 'Username'),
              ),
              const SizedBox(height:16),
              //Textfield untuk Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              //Textfield untuk Password
              TextField(
                controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
      });
      },
                ),
              ),
              ),
                
                 
              // TODO: 3. TOMBOL REGISTER
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    if (validateRegistration( email, password)) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isRegisteredIn', true);
                      await prefs.setString('username', username);
                      await prefs.setString('email', email);
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Invalid registration')));
                    }
                  },
                  child: const Text('Register')),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Have an account? Login here',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateRegistration(String email, String password) {
    for (User user in userList) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }
}