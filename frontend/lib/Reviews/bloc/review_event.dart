import '../review.dart';

abstract class ReviewEvent {}

// done
class ReviewsGetAllEvent extends ReviewEvent {
  final int trainerId;

  ReviewsGetAllEvent({required this.trainerId});
}


// done
class ReviewCreateEvent extends ReviewEvent {
  final Review review;

  ReviewCreateEvent({required this.review});
}


class ReviewGetTraineeReview extends ReviewEvent {
  final int trainerId;

  ReviewGetTraineeReview(
      {required this.trainerId});
}

class ReviewPostForTrainerEvent extends ReviewEvent {
  final Review review;
  final int trainerId;

  ReviewPostForTrainerEvent({required this.review, required this.trainerId});
}

class ReviewDeleteReviewEvent extends ReviewEvent {
  final int reviewId;

  ReviewDeleteReviewEvent({required this.reviewId});
}

class ReviewUpdateReviewEvent extends ReviewEvent {
  final Review review;

  ReviewUpdateReviewEvent(this.review);
}
