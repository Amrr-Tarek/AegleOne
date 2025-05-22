import 'package:flutter/material.dart';
import 'package:aegleone/pages/home.dart';

class User {
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userType;
  User({
    required this.userType,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AegleOne',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
