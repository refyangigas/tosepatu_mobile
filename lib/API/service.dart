import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthService {
  static const String apiUrl = 'http://tosepatu.wdmif.id/api/login';

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

      await prefs.setInt('user_id', int.parse(user['id'].toString()));
      await prefs.setInt('user_id_role', int.parse(user['id_role'].toString()));
      await prefs.setString('user_name', user['name']);
      await prefs.setString('user_email', user['email']);
      await prefs.setString(
          'user_email_verified_at', user['email_verified_at']);
      await prefs.setString('user_created_at', user['created_at']);
      await prefs.setString('user_updated_at', user['updated_at']);

      final userName = prefs.getString('user_name');
      print('$userName');
    } catch (e) {
      print('$e');
      throw Exception('Failed to save user data');
    }
  }

  static const String apiUrlr = 'http://tosepatu.wdmif.id/api/register';

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

class StatusApiService {
  static Future<List<dynamic>> getStatusApi() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('user_id');

    if (idUser == null) {
      throw Exception('User ID not found');
    }

    final url = Uri.parse('http://tosepatu.wdmif.id/api/apistatus');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'id_user': idUser});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<dynamic>.from(data);
    } else {
      throw Exception('Failed to fetch status');
    }
  }
}

class PembayaranApiService {
  static Future<List<dynamic>> getPembayaranApi() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('user_id');

    if (idUser == null) {
      throw Exception('User ID not found');
    }

    final url = Uri.parse('http://tosepatu.wdmif.id/api/apipembayaran');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'id_user': idUser});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<dynamic>.from(data);
    } else {
      throw Exception('Failed to fetch status');
    }
  }
}

class ProfileService {
  Future<Map<String, dynamic>> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('user_id');

    if (idUser == null) {
      throw Exception('User ID not found');
    }

    final url = Uri.parse('http://tosepatu.wdmif.id/api/apiprofile');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'id_user': idUser});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to fetch user profile');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> updateUserProfile({
    String? name,
    String? email,
    String? password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('user_id');

    if (idUser == null) {
      throw Exception('User ID not found');
    }

    final url = Uri.parse('http://tosepatu.wdmif.id/api/updateprofile');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'id_user': idUser,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Successfully updated the user profile
      } else {
        throw Exception('Failed to update user profile');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to connect to the server');
    }
  }
}

class LayananService {
  static Future<List<dynamic>> fetchLayananList(String apiUrl) async {
    final response =
        await http.get(Uri.parse('http://tosepatu.wdmif.id/api/apilayanan'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Failed to fetch layanan list');
    }
  }
}

class UploadService {
  Future<void> uploadBukti(int id, File bukti) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'http://tosepatu.wdmif.id/api/apibukti'), // Ganti URL_ENDPOINT dengan URL endpoint service Anda
    );

    request.fields['id'] = id.toString();
    request.files.add(await http.MultipartFile.fromPath('bukti', bukti.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Bukti berhasil diunggah');
      } else {
        print('Gagal mengunggah bukti. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengunggah bukti: $e');
    }
  }
}
