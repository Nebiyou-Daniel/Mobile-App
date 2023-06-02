// This provides the data from the API to the caller

import 'dart:convert';
import 'package:frontend/domain/Trainee/model/trainee_model.dart';
import 'package:http/http.dart' as http;

class ApiDataProvider {
  // method to get trainee list
  getTraineeList({required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:3050/trainer/myTrainees'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonList = jsonDecode(response.body) as List<dynamic>;

        List<Trainee> trainees =
            jsonList.map((jsonObject) => Trainee.fromJson(jsonObject)).toList();

        return trainees;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Trainee: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Trainee: $e');
    }
  }

  getAllTraineeList({required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:3050/admin/trainees'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonList = jsonDecode(response.body) as List<dynamic>;

        List<Trainee> trainees =
            jsonList.map((jsonObject) => Trainee.fromJson(jsonObject)).toList();

        return trainees;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Trainees: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Trainees: $e');
    }
  }

  // method to get trainee detail
  getTraineeDetail({required int traineeId,
  required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:3050/trainer/myTrainees/$traineeId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Trainee? trainee = Trainee.fromJson(jsonDecode(response.body));
        return trainee;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Trainee: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Trainee: $e');
    }
  }
}
