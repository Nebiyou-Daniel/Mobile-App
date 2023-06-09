import 'package:equatable/equatable.dart';

abstract class WeightState extends Equatable {
}

class WeightInitial extends WeightState {
  @override
  List<Object?> get props => [];
}

class WeightLoading extends WeightState {
  @override
  List<Object?> get props => [];
}

class WeightLoadedSuccessfully extends WeightState {
  final Map<double, double> weightData;

  WeightLoadedSuccessfully({required this.weightData});

  @override
  List<Object?> get props => [weightData];
}

class WeightLoadingError extends WeightState {
  final String error;

  WeightLoadingError({required this.error});
  @override
  List<Object?> get props => [];
}

class WeightOperationSuccess extends WeightState {
  @override
  List<Object?> get props => [];
}
