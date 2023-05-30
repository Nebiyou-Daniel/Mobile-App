import 'package:equatable/equatable.dart';

import '../model/review_model.dart';

abstract class ReviewState extends Equatable {}

// review initila
class ReviewInitial extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewLoading extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewLoaded extends ReviewState {
  final List<Review> reviews;
  ReviewLoaded({required this.reviews});
  @override
  List<Object?> get props => [reviews];
}

class ReviewError extends ReviewState {
  final String message;
  ReviewError({required this.message});
  @override
  List<Object?> get props => [message];
}

class ReviewOperationSuccess extends ReviewState {
  final String message;

  ReviewOperationSuccess({required this.message});
  @override
  List<Object?> get props => [];
}

class ReviewOperationFailure extends ReviewState {
  final String message;
  ReviewOperationFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
