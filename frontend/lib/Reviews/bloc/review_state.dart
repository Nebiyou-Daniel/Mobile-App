import 'package:equatable/equatable.dart';

import '../model/review_model.dart';

abstract class ReviewState extends Equatable {}

// review initila
class ReviewInitial extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewLoadingState extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewListLoadSuccess extends ReviewState {
  final List<Review> reviews;
  ReviewListLoadSuccess({required this.reviews});
  @override
  List<Object?> get props => [reviews];
}


class ReviewListLoadError extends ReviewState {
  final String message;
  ReviewListLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}



class ReviewLoadSuccess extends ReviewState {
  final Review review;
  ReviewLoadSuccess({required this.review});
  @override
  List<Object?> get props => [review];
}


class ReviewLoadError extends ReviewState {
  final String message;
  ReviewLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}

class ReviewOperationFailure extends ReviewState {
  final String message;
  ReviewOperationFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class ReviewOperationSuccess extends ReviewState {
  final String message;
  ReviewOperationSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}


class ReviewEmpty extends ReviewState {
  @override
  List<Object?> get props => [];
}
