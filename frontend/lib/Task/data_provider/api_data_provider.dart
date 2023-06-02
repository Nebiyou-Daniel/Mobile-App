// import http
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/task_model.dart';

class ApiDataProvider {
  ApiDataProvider();

// define the url base and so
  getSelfTaskData({
      required String date,
      required String accessToken}) async {
    try {
      final http.Response response = await http
          .get(
            Uri.parse('http://localhost:3050/task/trainee/$date'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': accessToken
            },
            // body: jsonEncode(<String, dynamic>{
            //   "trainerId": trainerId,
            //   "assignedDate": date
            // }),
          )
          .timeout(const Duration(seconds: 2));

      
      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Task task = Task.fromJson(jsonDecode(response.body));
        return task;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get task: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get task: $e');
    }
  }

  getTaskData(
      {required int traineeId,
      required String date,
      required String accessToken}) async {
    try {
      final http.Response response = await http
        .get(
          Uri.parse('http://localhost:3050/task/trainer/$traineeId/$date'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': accessToken
          },
          // body: jsonEncode(<String, dynamic>{
          //   "traineeId": traineeId,
          //   "assignedDate": date
          // }),
        )
        .timeout(const Duration(seconds: 2));
      
      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Task task = Task.fromJson(jsonDecode(response.body));
        return task;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get task: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get task: $e');
    }
  }
  createTask({
    required Task task,
    required String accessToken,
  }) async {
    // try adding the task,
    try {
      final http.Response response = await http
          .post(
            Uri.parse('http://localhost:3050/task'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': accessToken
            },
            body: jsonEncode(<String, dynamic>{
              'taskName': task.title,
              'description': task.description,
              'traineeId': task.traineeId
            }),
          )
          .timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Task task = Task.fromJson(jsonDecode(response.body));
        return task;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to create task: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }

  // to be imolemented later
  updateTask({required Task task, required String accessToken}) async {
    // try adding the task,
    try {
      final http.Response response = await http
          .patch(
            Uri.parse('http://localhost:3050/task/${task.id}'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': accessToken
            },
            body: jsonEncode(<String, dynamic>{
              'taskName': task.title,
              'description': task.description,
              'taskDone': task.isCompleted,
            }),
          )
          .timeout(const Duration(seconds: 2));
      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Task task = Task.fromJson(jsonDecode(response.body));
        return task;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to edit task: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to edit task: $e');
    }
  }

  // to be imolemented later
  deleteTask({required int taskId, required String accessToken}) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse('http://localhost:3050/task/$taskId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': accessToken
        },
        // body: jsonEncode(<String, dynamic>{
        //   'taskName': task.title,
        //   'description': task.description,
        //   'taskDone': task.isCompleted,
        // }),
      ).timeout(const Duration(seconds: 2));
      // if successfull return something, else throw an error
      if (response.statusCode == 200) {
        return "Task deleted successfully.";
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to delete task: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  setAsDone({required Task task, required String accessToken}) async {
    // try adding the task,
    try {
      final http.Response response = await http
          .patch(
            Uri.parse('http://localhost:3050/task/${task.id}/taskDone'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': accessToken
            },
            body: jsonEncode(<String, dynamic>{
              'taskDone': task.isCompleted,
            }),
          )
          .timeout(const Duration(seconds: 2));
      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Task task = Task.fromJson(jsonDecode(response.body));
        return task;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to Set task done status: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to Set task done status: $e');
    }
  }
}