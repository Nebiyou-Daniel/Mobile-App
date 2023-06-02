// This a dataprovidor that will be used to make api calls to the backend

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDataProvider {
  ApiDataProvider();

  login(
      {required String email,
      required String password,
      required String role}) async {
    Map<String, String> roleToBaseUrl = {
      "trainee": "http://127.0.0.1:3050/auth/traineeLogin",
      "trainer": "http://127.0.0.1:3050/auth/trainerLogin",
      "admin": "http://127.0.0.1:3050/auth/adminLogin",
    };

    try {
      final String baseUrl = roleToBaseUrl[role]!;
      final http.Response response = await http
          .post(
            Uri.parse(baseUrl),
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
      print("response");
      print(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("response successfull");
        String accessToken = jsonDecode(response.body)['access_token'];
        return accessToken;
      } else {
        print("response failed");
        String errorMessage = jsonDecode(response.body)['message'];
        throw Exception('Failed to login: Invalid Credentials.');
      }
    } on TimeoutException {
      throw Exception(
          'Login request timed out: Check your Internet Connection.');
    } catch (e) {
      throw Exception('$e');
    }
  }

  signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    Map<String, String> roleToBaseUrl = {
      "trainee": "http://127.0.0.1:3050/auth/traineeSignup",
      "trainer": "http://127.0.0.1:3050/auth/trainerSignup",
    };

    try {
      final String baseUrl = roleToBaseUrl[role]!;
      final response = await http
          .post(
            Uri.parse(baseUrl),
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
        throw Exception('Failed to Signup: $errorMessage');
      }
    } on TimeoutException {
      throw Exception(
          'signup request timed out, Check your Internet Connection');
    } catch (e) {
      throw Exception('Failed to Signup: $e');
    }
  }

  deleteSelfAccount({required String accessToken, required String role}) async {
    Map<String, String> roleToBaseUrl = {
      "trainee": "http://127.0.0.1:3050/trainee",
      "trainer": "http://127.0.0.1:3050/trainer",
    };

    try {
      final String baseUrl = roleToBaseUrl[role]!;
      final response = await http
          .delete(
            Uri.parse(baseUrl),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'authorization': accessToken,
            },
            body: jsonEncode(<String, String>{}),
          )
          .timeout(const Duration(seconds: 2));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception('Failed to delete account: $error');
    }
  }

  deleteAccountById(
      {required String accessToken,
      required String role,
      required int id}) async {
    Map<String, String> roleToBaseUrl = {
      "trainee": "http://127.0.0.1:3050/admin/deleteTrainee",
      "trainer": "http://127.0.0.1:3050/admin/deleteTrainer",
    };

    try {
      final String baseUrl = roleToBaseUrl[role]!;
      final response = await http
          .delete(
            Uri.parse(baseUrl),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'authorization': accessToken,
            },
            body: jsonEncode(<String, String>{
              'id': id.toString(),
            }),
          )
          .timeout(const Duration(seconds: 2));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }
}
