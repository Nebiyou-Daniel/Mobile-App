



// states would be loading, loaded, error

import 'package:equatable/equatable.dart';

abstract class TrainerHiringState extends Equatable{}

class TrainerHiringInitial extends TrainerHiringState {
  @override
  List<Object?> get props => [];
}

class TrainerHiringLoading extends TrainerHiringState {
  @override
  List<Object?> get props => [];
}

class TrainerHiringLoaded extends TrainerHiringState {
  final bool isHired;

  TrainerHiringLoaded({required this.isHired});
  @override
  List<Object?> get props => [];
}

class TrainerHiringError extends TrainerHiringState {
  @override
  List<Object?> get props => [];
}
