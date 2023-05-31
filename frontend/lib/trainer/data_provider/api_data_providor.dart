// This provides the data from the API to the caller

import 'dart:convert';
import 'package:frontend/trainee/model/trainee_model.dart';
import 'package:http/http.dart' as http;

import '../model/trainer_model.dart';

class ApiDataProvider {
  // this class is used to get data from the API
  // this class is used by the bloc

  // method to get trainee list
  Future<List<Trainee>> getTraineeList() async {
    // this method is used to get trainee list from the API
    // this method is used by the bloc
    // url to get trainee list
    String url = 'http://localhost:8000/api/trainee/';

    // get response from the API
    var response = await http.get(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create list of trainee from json data
      List<Trainee> traineeList = [];
      for (var item in jsonData) {
        Trainee trainee = Trainee.fromJson(item);
        traineeList.add(trainee);
      }

      // return trainee list
      return traineeList;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to load trainee list');
    }
  }

  // method to get trainee detail
  Future<Trainee> getTraineeDetail(int id) async {
    // this method is used to get trainee detail from the API
    // this method is used by the bloc

    // url to get trainee detail
    String url = 'http://localhost:8000/api/trainee/$id/';

    // get response from the API
    var response = await http.get(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create trainee from json data
      Trainee trainee = Trainee.fromJson(jsonData);

      // return trainee
      return trainee;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to load trainee detail');
    }
  }

  // method to create trainee
  Future<Trainee> createTrainee(Trainee trainee) async {
    // this method is used to create trainee from the API
    // this method is used by the bloc

    // url to create trainee
    String url = 'http://localhost:8000/api/trainee/';

    // get response from the API
    var response = await http.post(Uri.parse(url), body: trainee.toJson());

    // check if response is successful
    if (response.statusCode == 201) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create trainee from json data
      Trainee trainee = Trainee.fromJson(jsonData);

      // return trainee
      return trainee;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to create trainee');
    }
  }

  // method to update trainee
  Future<Trainee> updateTrainee(Trainee trainee) async {
    // this method is used to update trainee from the API
    // this method is used by the bloc

    // url to update trainee
    String url = 'http://localhost:8000/api/trainee/${trainee.id}/';

    // get response from the API
    var response = await http.put(Uri.parse(url), body: trainee.toJson());

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create trainee from json data
      Trainee trainee = Trainee.fromJson(jsonData);

      // return trainee
      return trainee;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to update trainee');
    }
  }

  // method to delete trainee
  Future<void> deleteTrainee(int id) async {
    // this method is used to delete trainee from the API
    // this method is used by the bloc

    // url to delete trainee
    String url = 'http://localhost:8000/api/trainee/$id/';

    // get response from the API
    var response = await http.delete(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 204) {
      // do nothing
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to delete trainee');
    }
  }

// adding trainee to trainee list
  Future<Trainee> addTrainee(int id) async {
    // this method is used to add trainee from the API
    // this method is used by the bloc

    // url to add trainee
    String url = 'http://localhost:8000/api/trainee/$id/';

    // get response from the API
    var response = await http.post(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create trainee from json data
      Trainee trainee = Trainee.fromJson(jsonData);

      // return trainee
      return trainee;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to add trainee');
    }
  }

  // method to get trainee list
  Future<List<Trainee>> getTraineeListBySearch(String search) async {
    // this method is used to get trainee list from the API
    // this method is used by the bloc

    // url to get trainee list
    String url = 'http://localhost:8000/api/trainee/?search=$search';

    // get response from the API
    var response = await http.get(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create list of trainee from json data
      List<Trainee> traineeList = [];
      for (var item in jsonData) {
        Trainee trainee = Trainee.fromJson(item);
        traineeList.add(trainee);
      }

      // return trainee list
      return traineeList;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to load trainee list');
    }
  }

  // method to get trainer information by id
  Future<Trainer> getTrainerInformation(int id) async {
    // this method is used to get trainer information from the API
    // this method is used by the bloc

    // url to get trainer information
    String url = 'http://localhost:8000/api/trainer/$id/';

    // get response from the API
    var response = await http.get(Uri.parse(url));

    // check if response is successful
    if (response.statusCode == 200) {
      // convert response body to json
      var jsonData = jsonDecode(response.body);

      // create trainer from json data
      Trainer trainer = Trainer.fromJson(jsonData);

      // return trainer
      return trainer;
    } else {
      // if response is not successful, throw error
      throw Exception('Failed to load trainer information');
    }
  }
}
