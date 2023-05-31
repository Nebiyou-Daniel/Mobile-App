import '../../trainee/model/trainee_model.dart';

abstract class TrainerEvent {}

class GettingTraineeListEvent extends TrainerEvent {}

class GettingTraineeDetailEvent extends TrainerEvent {
  final int id;
  GettingTraineeDetailEvent({required this.id});
}

class TraineeListReceivedSuccessfullyEvent extends TrainerEvent {
  final List<Trainee> traineeList;

  TraineeListReceivedSuccessfullyEvent({required this.traineeList});
}

class TrainerLoading extends TrainerEvent {
  final int id;
  TrainerLoading({required this.id});
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
