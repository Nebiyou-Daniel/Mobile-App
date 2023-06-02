import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/weight_mode.dart';

class ApiDataProvidor {
  // define the url and stuff
  //add weight for trainee
  addWeightForTrainee(
      {required Weight weight, required String accessToken}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('http://localhost:3050/weight/trainee'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': accessToken
        },
        body: jsonEncode(<String, dynamic>{
          "weight": weight.weight,
          "height": weight.height,
        }),
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Weight weight = Weight.fromJson(jsonDecode(response.body));
        return weight;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to add Weight: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to add Weight: $e');
    }
  }

  getSelfWeightData({required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://localhost:3050/weight/trainee'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': accessToken
        },
        // body: jsonEncode(<String, dynamic>{
        //   "weight": weight.weight,
        //   "height": weight.height,
        // }),
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonList = jsonDecode(response.body) as List<dynamic>;
        List<Weight> weights = jsonList.map((jsonObject) => Weight.fromJson(jsonObject)).toList() ;
        return weights;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get Weights: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get Weights: $e');
    }
  }

  // updateWeightById({required int weightId}) async{
  //   try {
  //     final http.Response response = await http.patch(
  //       Uri.parse('http://localhost:3050/weight/$weightId'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         // 'authorization': accessToken
  //       },
  //       // body: jsonEncode(<String, dynamic>{
  //       //   "weight": weight.weight,
  //       //   "height": weight.height,
  //       // }),
  //     ).timeout(const Duration(seconds: 2));

  //     // if successfull return something, else throw an error
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       var jsonList = jsonDecode(response.body) as List<dynamic>;
  //       List<Weight> weights = jsonList.map((jsonObject) => Weight.fromJson(jsonObject)).toList() ;
  //       return weights;
  //     } else {
  //       String errorMessage = jsonDecode(response.body)['message'][0];
  //       throw Exception('Failed to get Weights: $errorMessage');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to get Weights: $e');
  //   }
  // }
}
