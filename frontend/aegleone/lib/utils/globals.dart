// import 'package:flutter/material.dart';
// utils/globals.dart
const String apiBaseUrl =
    'http://your-django-backend-url'; // Replace with your actual URL

class UserData {
  static String _name = "John Doe";
  static String _userType = "patient";

  static String _email = "john@example.com";
  static String gender = "male";
  static int _age = 24;
  // Add other data

  // Getters
  static String get name => _name;
  static String get userType => _userType;
  static String get email => _email;
  static int get age => _age;

  // Setters
  static set name(String value) {
    const allowedChars = "abcdefghijklmnopqrstuvwxyz0123456789-_";

    if (value
        .toLowerCase()
        .split('')
        .any((char) => !allowedChars.contains(char))) {
      throw const FormatException(
          "Name can only contain letters, underscores, dashes, and numbers");
    } else {
      _name = value;
    }
  }

  static set email(String value) {
    if (!value.contains("@")) {
      throw const FormatException("Invalid Email!");
    } else {
      _email = value;
    }
  }

  static set userType(String value) {
    const allowedTypes = ["patient", "doctor", "admin", "pharmacy", "visitor"];

    if (!allowedTypes.contains(value)) {
      throw const FormatException("Invalid User Type!");
    } else {
      _userType = value;
    }
  }

  static set age(int value) {
    if (value <= 0) {
      throw ArgumentError("Age must be positive!");
    } else {
      _age = value;
    }
  }
  // Make a function for setting user's type
}
