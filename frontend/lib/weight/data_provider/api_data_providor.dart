import 'dart:math';

import 'package:flutter/material.dart';

class ApiDataProvidor {
  // define the url and stuff

  getSelfWeightData() async {
    await Future.delayed(const Duration(seconds: 5));

    // random chance
    return {
      1.1: 52.0,
      2.02: 52.3,
      5.2: 52.3,
    };
  }

  getWeightData(int userId) async {
    await Future.delayed(const Duration(seconds: 5));

    // random chance
    return {
      1.1: 52.0,
      2.02: 63.3,
      5.2: 88.3,
    };
  }
}
