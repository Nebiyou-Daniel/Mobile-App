// This a dataprovidor that will be used to make api calls to the backend

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDataProvider {
  ApiDataProvider();

  traineeLogin(
      {required String email,
      required String password,
      required String role}) async {
    try {
      final http.Response response = await http
          .post(
            Uri.parse('http://localhost:3050/auth/traineeLogin'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
              'role': role
            }),
          )
          .timeout(const Duration(seconds: 2));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = jsonDecode(response.body)['accessToken'][0];
        return accessToken;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to login: $errorMessage');
      }
    } on TimeoutException {
      throw Exception(
          'Login request timed out: Check your Internet Connection.');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  traineeSignUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('http://127.0.0.1:3050/auth/traineeSignup'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
              'fullName': name,
              'role': role,
            }),
          )
          .timeout(const Duration(seconds: 2));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = jsonDecode(response.body)['access_token'];
        return accessToken;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to login: $errorMessage');
      }
    } on TimeoutException {
      throw Exception(
          'signup request timed out, Check your Internet Connection');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  trainerSignUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('http://127.0.0.1:3050/auth/trainerSignup'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
              'fullName': name,
              'role': role,
            }),
          )
          .timeout(const Duration(seconds: 2));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = jsonDecode(response.body)['access_token'];
        return accessToken;
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } on TimeoutException {
      throw Exception(
          'signup request timed out, Check your Internet Connection');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  logout() async {
    final response = await http.post(
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
    final response = await http.delete(
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
}
