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
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse['user'];

        // Simpan setiap elemen di dalam user ke SharedPreferences
        await saveUserToSharedPreferences(user);

        print("hai");
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Failed to login2');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to login');
    }
  }

  Future<void> saveUserToSharedPreferences(Map<String, dynamic> user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Simpan setiap elemen di dalam user secara terpisah
      await prefs.setInt('user_id', user['id']);
      await prefs.setInt('user_id_role', user['id_role']);
      await prefs.setString('user_name', user['name']);
      await prefs.setString('user_email', user['email']);
      await prefs.setString(
          'user_email_verified_at', user['email_verified_at']);
      await prefs.setString('user_created_at', user['created_at']);
      await prefs.setString('user_updated_at', user['updated_at']);
      final userName = prefs.getString('user_name');
      print('$userName');
    } catch (e) {
      throw Exception('Failed to save user data');
    }
  }

  static const String apiUrlr = 'http://10.0.2.2:8000/api/register';

  Future<void> register(String name, String email, String password) async {
    try {
      final response = await http.post(Uri.parse(apiUrlr), body: {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse['user'];

        print("User registered successfully");
        print("User details:");
        print("ID: ${user['id']}");
        print("Name: ${user['name']}");
        print("Email: ${user['email']}");
        // ... tambahkan info pengguna lainnya sesuai kebutuhan
      } else if (response.statusCode == 422) {
        final jsonResponse = json.decode(response.body);
        final errors = jsonResponse['errors'];
        throw Exception(errors);
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to register');
    }
  }
}
