// This a dataprovidor that will be used to make api calls to the backend

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show post, get, put, delete;

import '../../User/Model/user_profile.dart';

class ApiDataProvider {
  ApiDataProvider();

  login({required String email, required String password}) async {
    try {
      final response = await post(
        Uri.parse('http://localhost:3000/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to login');
      }
    } on TimeoutException {
      throw Exception('Login request timed out');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String username,
    required String role,
  }) async {
    try {
      final response = await post(
        Uri.parse('http://localhost:3000/api/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'name': name,
          'phoneNumber': phoneNumber,
          'Username': username,
          'role': role,
        }),
      ).timeout(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to login');
      }
    } on TimeoutException {
      throw Exception('signup request timed out');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  logout() async {
    final response = await post(
      Uri.parse('http://localhost:3000/api/auth/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
    return jsonDecode(response.body);
  }

  // delete account
  deleteAccount() async {
    final response = await delete(
      Uri.parse('http://localhost:3000/api/auth/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete account');
    }
    return jsonDecode(response.body);
  }
  // other auth related api calls are placed here
}
