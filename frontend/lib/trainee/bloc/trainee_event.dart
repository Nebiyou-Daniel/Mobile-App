import 'package:flutter/widgets.dart';

import '../model/trainee_model.dart';

abstract class TraineeEvent {}

class GettraineeListEvent extends TraineeEvent {}

class GetTraineeEvent extends TraineeEvent {
  final String id;

  GetTraineeEvent({required this.id});
}

class GettingTraineeListEvent extends TraineeEvent {}

class GettingTraineeDetailEvent extends TraineeEvent {
  final int id;
  GettingTraineeDetailEvent({required this.id});
}

class TraineeListReceivedSuccessfullyEvent extends TraineeEvent {
  // initialized by using the Trainee model instance this is
  // a list so used in the UI to show the list of trainees as .builder()
  final List<Trainee> traineeList;

  TraineeListReceivedSuccessfullyEvent({required this.traineeList});
}

class TraineeDetailReceivedSuccessfullyEvent extends TraineeEvent {}

class TraineeListReceivedErrorEvent extends TraineeEvent {}

class TraineeDetailReceivedErrorEvent extends TraineeEvent {}

class TraineeListEmptyEvent extends TraineeEvent {}

class TraineeDetailEmptyEvent extends TraineeEvent {}

class TraineeAddToTraineeListEvent extends TraineeEvent {}

class TraineeRemoveFromTraineeListEvent extends TraineeEvent {
  final int traineeId;
  TraineeRemoveFromTraineeListEvent({required this.traineeId});
}

class TraineeAddToTraineeListSuccessEvent extends TraineeEvent {}

class TraineeAddToTraineeListErrorEvent extends TraineeEvent {}

class TraineeRemoveFromTraineeListSuccessEvent extends TraineeEvent {}

class TraineeRemoveFromTraineeListErrorEvent extends TraineeEvent {}
