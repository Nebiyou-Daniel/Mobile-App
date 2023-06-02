// This provides the data from the API to the caller

import 'dart:convert';
import 'package:frontend/trainee/model/trainee_model.dart';
import 'package:http/http.dart' as http;

import '../model/trainer_model.dart';

class ApiDataProvider {
  // get all trainers

  getAllTrainers({
    required String accessToken,
    required String role,
  }) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:3050/$role/trainers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      ).timeout(const Duration(seconds: 2));
      print(response.body);
      print(response.statusCode);

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List jsonList = jsonDecode(response.body);
        print(jsonList.runtimeType);
        List<Trainer> trainers = [];
        for (var json in jsonList) {
          trainers.add(Trainer.fromJson(json));
        }

        return trainers;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Trainer: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Trainer: $e');
    }
  }

  // get my trainer
  getMyTrainer({required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:3050/trainee/myTrainer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        return json['trainerId'];
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Trainer: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Trainer: $e');
    }
  }
}
