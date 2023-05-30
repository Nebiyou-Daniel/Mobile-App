import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/trainee_model.dart';

class TraineeState extends Equatable {
  const TraineeState();

  @override
  List<Object> get props => [];
}


class TraineeInitial extends TraineeState {}

class TraineeLoading extends TraineeState {}

class TraineeListLoadSuccess extends TraineeState {
  final List<Trainee> trainees;

  const TraineeListLoadSuccess({required this.trainees});

  @override
  List<Object> get props => [trainees];
}

class TraineeOperationFailure extends TraineeState {
  final String error;

  const TraineeOperationFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class TraineeAddSuccess extends TraineeState {
  final Trainee trainee;

  TraineeAddSuccess({required this.trainee});

  @override
  List<Object> get props => [trainee];
}

class TraineeAddError extends TraineeState {
  final String error;

  TraineeAddError({required this.error});

  @override
  List<Object> get props => [error];
}

class TraineeListEmpty extends TraineeState {}

class TraineeLoadSuccess extends TraineeState {
  final List<Trainee> trainees;

  const TraineeLoadSuccess({required this.trainees});

  @override
  List<Object> get props => [trainees];
}

class TraineeDeleteSuccess extends TraineeState {
  final Trainee trainee;

  const TraineeDeleteSuccess({required this.trainee});

  @override
  List<Object> get props => [trainee];
}
