import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String apiUrl = 'http://10.0.2.2:8000/api/login';

  Future<void> login(String emailOrUsername, String password) async {
    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': emailOrUsername,
        'password': password,
      });
      if (response.statusCode == 200) {
        print("hai");
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to login');
    }
  }
}
