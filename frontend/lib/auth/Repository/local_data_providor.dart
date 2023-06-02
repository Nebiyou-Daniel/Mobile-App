import 'package:http/http.dart' as http;
import 'dart:convert';

class LocalDataProvider {
  final String apiUrl = "http://localhost:3050/auth/traineeSignup";

  getAccessToken() async {
    // q: where should I store tha token in the app
    // a: https://stackoverflow.com/questions/12649573/where-to-store-access-token-in-flutter

    try {
      // Make a request to the backend server to retrieve the token
      final response = await http.get(Uri.parse('$apiUrl/get-token'));

      if (response.statusCode == 200) {
        // Token retrieval successful, parse and return the token
        final tokenData = json.decode(response.body);
        final token = tokenData['access_token'];

        return token;
      } else {
        // Token retrieval failed, throw an error or handle the failure gracefully
        throw Exception('Failed to retrieve access token');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      throw Exception('Error: $e');
    }
  }

  setAccessToken(String token) async {}
  deleteAccessToken() async {}
  readUserProfile() async {}
}
