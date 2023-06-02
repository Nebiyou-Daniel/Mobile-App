import 'package:flutter/widgets.dart';

import '../model/trainee_model.dart';

abstract class TraineeEvent {}

class TraineesListLoadEvent extends TraineeEvent {}

class TraineeLoadEvent extends TraineeEvent {
  final int id;

  TraineeLoadEvent({required this.id});
}

class TraineeDeleteEvent extends TraineeEvent {
  final int id;

  TraineeDeleteEvent({required this.id});
}

class TraineeListLoadEvent extends TraineeEvent {}

class TraineeDetailLoadEvent extends TraineeEvent {
  final int id;
  TraineeDetailLoadEvent({required this.id});
}

class TraineeListReceivedSuccessfullyEvent extends TraineeEvent {
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



class TraineeLoadListOfTrainersEvent extends TraineeEvent {}

// sorting the trainers by some criteria
class TraineeSortTrainersEvent extends TraineeEvent {
  final String criteria;
  TraineeSortTrainersEvent({required this.criteria});
}
