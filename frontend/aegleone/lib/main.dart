import 'package:flutter/material.dart';
import 'package:aegleone/pages/home.dart';
import 'package:aegleone/pages/login.dart';
import 'package:aegleone/pages/registration.dart';

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AegleOne',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AegleOne',
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegistrationPage(),
      },
    );
  }
}
