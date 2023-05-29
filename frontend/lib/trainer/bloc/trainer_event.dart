import '../../trainee/model/trainee_model.dart';

abstract class TrainerEvent {}

class GetTraineeEvent extends TrainerEvent {
  final String id;

  GetTraineeEvent({required this.id});
}

class GettingTraineeListEvent extends TrainerEvent {}

class GettingTraineeDetailEvent extends TrainerEvent {
  final int id;
  GettingTraineeDetailEvent({required this.id});
}

class TraineeListReceivedSuccessfullyEvent extends TrainerEvent {
  // initialized by using the Trainee model instance this is
  // a list so used in the UI to show the list of trainees as .builder()
  final List<Trainee> traineeList;

  TraineeListReceivedSuccessfullyEvent({required this.traineeList});
}

class TraineeDetailReceivedSuccessfullyEvent extends TrainerEvent {}

class TraineeListReceivedErrorEvent extends TrainerEvent {}

class TraineeDetailReceivedErrorEvent extends TrainerEvent {}

class TraineeListEmptyEvent extends TrainerEvent {}

class TraineeDetailEmptyEvent extends TrainerEvent {}

class TraineeAddToTraineeListEvent extends TrainerEvent {}

class TraineeRemoveFromTraineeListEvent extends TrainerEvent {
  final int traineeId;
  TraineeRemoveFromTraineeListEvent({required this.traineeId});
}

class TraineeAddToTraineeListSuccessEvent extends TrainerEvent {}

class TraineeAddToTraineeListErrorEvent extends TrainerEvent {}

class TraineeRemoveFromTraineeListSuccessEvent extends TrainerEvent {}

class TraineeRemoveFromTraineeListErrorEvent extends TrainerEvent {}

class TraineeLoadListOfTrainersEvent extends TrainerEvent {}


// sorting the trainers by some criteria
class TraineeSortTrainersEvent extends TrainerEvent {
  final String criteria;
  TraineeSortTrainersEvent({required this.criteria});
}