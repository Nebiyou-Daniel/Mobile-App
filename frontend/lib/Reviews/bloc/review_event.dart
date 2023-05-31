import '../review.dart';

abstract class ReviewEvent {}

class ReviewsGetAllEvent extends ReviewEvent {
  final int trainerId;

  ReviewsGetAllEvent({required this.trainerId});
}

class ReviewPostReviewEvent extends ReviewEvent {
  final Review review;

  ReviewPostReviewEvent(this.review);
}

class ReviewDeleteReviewEvent extends ReviewEvent {
  final int reviewId;

  ReviewDeleteReviewEvent(this.reviewId);
}

class ReviewUpdateReviewEvent extends ReviewEvent {
  final Review review;

  ReviewUpdateReviewEvent(this.review);
}
