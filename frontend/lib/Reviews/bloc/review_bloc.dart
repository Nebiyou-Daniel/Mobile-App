import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../serviceLocator.dart';
import '../dataprovidor/api_data_providor.dart';
import '../review.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    ApiDataProvidor apiDataProvidor = ApiDataProvidor();
    SharedPreferences preferences = ServiceLocator().preferences;

    // getting all reviews for a trainer
    on<ReviewsGetAllEvent>((event, emit) async {
      emit(ReviewLoadingState());
      try {
        final String accessToken = preferences.getString('access_token')!;
        final reviews = await apiDataProvidor.getAllReviewsForTrainer(accessToken: accessToken);
        emit(ReviewListLoadSuccess(reviews: reviews));
      } catch (error) {
        emit(ReviewListLoadError(message: error.toString()));
      }
    });

    // creating a review Event
    on<ReviewCreateEvent>((event, emit) async {
      emit(ReviewLoadingState());
      try {
        final String accessToken = preferences.getString('access_token')!;
        final review = await apiDataProvidor.postReview(
            review: event.review, accessToken: accessToken);
        emit(ReviewOperationSuccess(message: "Review Created Successfully"));
      } catch (error) {
        emit(ReviewOperationFailure(message: error.toString()));
      }
    });

    /// This will return the review the currently logged in trainee has wrote to the current trainer
    on<ReviewGetTraineeReview>((event, emit) async {
      emit(ReviewLoadingState());
      try {
        await Future.delayed(const Duration(seconds: 1));
        // TODO: not implement yet ......................
        final Review review = Review(
            id: 2,
            rating: 3,
            comment: "You are the best",
            traineeId: 3,
            trainerId: 3);

        emit(ReviewLoadSuccess(review: review));
      } catch (error) {
        emit(ReviewOperationFailure(message: error.toString()));
      }
    });

    on<ReviewDeleteReviewEvent> ((event, emit) async {
      emit(ReviewLoadingState());
      try {
        final String accessToken = preferences.getString('access_token')!;
        await apiDataProvidor.deleteReview(reviewId: event.reviewId, accessToken: accessToken);
        emit(ReviewOperationSuccess(message: "Review Deleted Successfully"));
      } catch (error) {
        emit(ReviewOperationFailure(message: error.toString()));
      }
    });

    on<ReviewUpdateReviewEvent> ((event, emit) async {
      emit(ReviewLoadingState());
      try {
        final String accessToken = preferences.getString('access_token')!;
        await apiDataProvidor.updateReview(review: event.review, accessToken: accessToken);
        emit(ReviewOperationSuccess(message: "Review Updated Successfully"));
      } catch (error) {
        emit(ReviewOperationFailure(message: error.toString()));
      }
    });

  }
}
