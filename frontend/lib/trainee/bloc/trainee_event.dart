import 'package:flutter/widgets.dart';

import '../model/trainee_model.dart';

abstract class TraineeEvent {}

class TraineesListLoadEvent extends TraineeEvent {}

class TraineeLoadEvent extends TraineeEvent {
  final int id;

  TraineeLoadEvent({required this.id});
}

class TraineeDeleteEvent extends TraineeEvent {
  final String id;

  TraineeDeleteEvent({required this.id});
}
