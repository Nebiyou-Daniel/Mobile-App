// This a dataprovidor that will be used to make api calls to the backend

import 'dart:convert';
import 'package:http/http.dart' show post, get, put, delete, Client;

class ApiDataProvider {
  final Client httpClient;

  ApiDataProvider({required this.httpClient});

  login({required String email, required String password}) async {
    final response = await post(
      Uri.parse('http://localhost:3000/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
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
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // return AuthUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up');
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
}
