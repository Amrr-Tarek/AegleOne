// pages/login.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aegleone/utils/globals.dart'; // Adjust import based on your package name

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form fields
      // Set UserData.name to username
      try {
        UserData.name = _usernameController.text;
        // Set userType based on username
        if (_usernameController.text.toLowerCase() == 'admin') {
          UserData.userType = 'admin';
        } else if (_usernameController.text.toLowerCase() == 'patient') {
          UserData.userType = 'patient';
        } else if (_usernameController.text.toLowerCase() == 'doctor') {
          UserData.userType = 'doctor';
        } else if (_usernameController.text.toLowerCase() == 'pharmacy') {
          UserData.userType = 'pharmacy';
        } else {
          UserData.userType = 'visitor';
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data error: $e')),
        );
        return;
      }
      setState(() {
        _isLoading = true;
      });

      try {
        // final response = await http.post(
        //   Uri.parse('$apiBaseUrl/login/'),  // Uses global variable from globals.dart
        //   headers: {'Content-Type': 'application/json'},
        //   body: jsonEncode({
        //     'username': _usernameController.text,
        //     'password': _passwordController.text,
        //   }),
        // );

        // response.statusCode == 200
        if (true) {
          // final data = jsonDecode(response.body);
          // final token = 'mohab'; // data['token']
          // TODO: Store token securely (e.g., using flutter_secure_storage)
          print('Login successful! Token: token');
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid credentials')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Set name only, not userType
                  if (value != null) {
                    try {
                      UserData.name = value;
                    } catch (e) {
                      // Optionally handle name validation error
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Don\'t have an account? Register here'),
              ),
            ],
//               const SizedBox(height: 20),
//               _isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _login,
//                       child: const Text('Login'),
//                     ),
//             ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
