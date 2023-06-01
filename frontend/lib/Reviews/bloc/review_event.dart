import '../review.dart';

abstract class ReviewEvent {}

class ReviewsGetAllEvent extends ReviewEvent {
  final int trainerId;

  ReviewsGetAllEvent({required this.trainerId});
}

class ReviewsGetByTraineeEvent extends ReviewEvent {
  final int trainerId;

  ReviewsGetByTraineeEvent(
      {required this.trainerId});
}

class ReviewPostForTrainerEvent extends ReviewEvent {
  final Review review;
  final int trainerId;

  ReviewPostForTrainerEvent({required this.review, required this.trainerId});
}

class ReviewDeleteReviewEvent extends ReviewEvent {
  final int reviewId;

  ReviewDeleteReviewEvent(this.reviewId);
}

class ReviewUpdateReviewEvent extends ReviewEvent {
  final Review review;

  ReviewUpdateReviewEvent(this.review);
}
