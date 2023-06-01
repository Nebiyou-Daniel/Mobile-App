// import http
import 'dart:convert';

import 'package:http/http.dart' show get, post;

class ApiDataProvider {
// define the url base and so
  getSelfTaskData(date) {
    // TODO: implement get self task later
  }

  getTaskByDateAndTraineeId(traineeId, date) {
    // TODO: impement get task by date
  }

  addTask(task, userId) async {
    // try adding the task,
    // if successfull return something, else throw an error

    dynamic response;
    try {
      response = await post(
        Uri.parse('http://localhost:5000/api/task'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(task),
      );
    } catch (error) {
      throw Exception('Failed to add Task, check your internet connection');
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.statusCode == 400
          ? 'You are unauthorized to add task to the user.'
          : 'An unknown error occurred, Try again.');
    }
  }

  // to be imolemented later
  updateTask(task) {}

  // to be imolemented later
  deleteTask(task) {}
}