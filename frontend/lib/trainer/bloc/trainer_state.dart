
// import equatable
import 'package:equatable/equatable.dart';

import '../../trainee/model/trainee_model.dart';
import '../model/trainer_model.dart';
import '../model/trainer_model.dart';

abstract class TrainerState extends Equatable {}

class TrainerInitial extends TrainerState {
  @override
  List<Object?> get props => [];
}

class TrainerDeleteSuccess extends TrainerState {
  @override
  List<Object?> get props => [];
}


class TrainerDeleteError extends TrainerState {
  final String error;

  TrainerDeleteError({required this.error});

  @override
  List<Object?> get props => [];
}

// getting trainee list
class GettingTraineeList extends TrainerState {
  @override
  List<Object?> get props => [];
}

// getting trainee detail
class GettingTraineeDetail extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list successfully
class TraineeRemoveFromTraineeListSuccess extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list error
class TraineeRemoveFromTraineeListError extends TrainerState {
  final String error;

  TraineeRemoveFromTraineeListError({required this.error});

  @override
  List<Object?> get props => [];
}


class TrainerListLoading extends TrainerState {
  @override
  List<Object?> get props => [];
}


class TrainerListLoadingSuccess extends TrainerState {
  final List<Trainer> trainerList;
  final String criteria;

  TrainerListLoadingSuccess({required this.trainerList, this.criteria = "None"});

  @override
  List<Object?> get props => [];
}


class TrainerListLoadingError extends TrainerState {
  final String error;

  TrainerListLoadingError({required this.error});

  @override
  List<Object?> get props => [];
}


class TrainerLoading extends TrainerState {
  @override
  List<Object?> get props => [];
}

class TrainerLoadSuccess extends TrainerState {
  final Trainer trainer;

  TrainerLoadSuccess({required this.trainer});

  @override
  List<Object?> get props => [];
}

class TrainerLoadingError extends TrainerState {
  final String error;

  TrainerLoadingError({required this.error});

  @override
  List<Object?> get props => [];
}

class TrainerListEmpty extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee list received error
class TraineeListReceivedError extends TrainerState {
  TraineeListReceivedError();

  @override
  List<Object?> get props => [];
}

// trainee detail received error
class TraineeDetailReceivedError extends TrainerState {
  final String error;

  TraineeDetailReceivedError({required this.error});

  @override
  List<Object?> get props => [];
}

// trainee list empty
class TraineeListEmpty extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee detail empty
class TraineeDetailEmpty extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list
class TraineeAddToTraineeList extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee removed from trainee list
class TraineeRemoveFromTraineeList extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list successfully
class TraineeAddToTraineeListSuccess extends TrainerState {
  @override
  List<Object?> get props => [];
}

// trainee added to trainee list error
class TraineeAddToTraineeListError extends TrainerState {
  final String error;

  TraineeAddToTraineeListError({required this.error});

  @override
  List<Object?> get props => [];
}

