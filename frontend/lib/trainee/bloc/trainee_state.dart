// import equatable
import 'package:equatable/equatable.dart';

import '../model/trainee_model.dart';

abstract class TraineeState extends Equatable {}

class TraineeInitial extends TraineeState {
  @override
  List<Object?> get props => [];
}

// getting trainee list
class GettingTraineeList extends TraineeState {
  @override
  List<Object?> get props => [];
}

// getting trainee detail
class GettingTraineeDetail extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee list received successfully
class TraineeListReceivedSuccessfully extends TraineeState {
  // initialized by using the Trainee model instance
  final List<Trainee> traineeList;

  TraineeListReceivedSuccessfully({required this.traineeList});

  @override
  List<Object?> get props => [];
}

// trainee detail received successfully
class TraineeDetailReceivedSuccessfully extends TraineeState {
  // initialized by using the Trainee model instance
  final Trainee trainee;

  TraineeDetailReceivedSuccessfully({required this.trainee});

  @override
  List<Object?> get props => [];
}

// trainee list received error
class TraineeListReceivedError extends TraineeState {
  TraineeListReceivedError();

  @override
  List<Object?> get props => [];
}

// trainee detail received error
class TraineeDetailReceivedError extends TraineeState {
  final String error;

  TraineeDetailReceivedError({required this.error});

  @override
  List<Object?> get props => [];
}

// trainee list empty
class TraineeListEmpty extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee detail empty
class TraineeDetailEmpty extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list
class TraineeAddToTraineeList extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list
class TraineeRemoveFromTraineeList extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list successfully
class TraineeAddToTraineeListSuccess extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list error
class TraineeAddToTraineeListError extends TraineeState {
  final String error;

  TraineeAddToTraineeListError({required this.error});

  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list successfully
class TraineeRemoveFromTraineeListSuccess extends TraineeState {
  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list error
class TraineeRemoveFromTraineeListError extends TraineeState {
  final String error;

  TraineeRemoveFromTraineeListError({required this.error});

  @override
  List<Object?> get props => [];
}
