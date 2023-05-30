import 'package:flutter_bloc/flutter_bloc.dart';
import '../review.dart';
import '../dataprovidor/api_data_providor.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    ApiDataProvidor apiDataProvidor = ApiDataProvidor();

    

    on<ReviewsGetAllEvent>((event, emit) async {
      emit(ReviewLoading());
      try {
        final reviews = await apiDataProvidor.getAllReviewsForTrainer(trainerId: event.trainerId);
        emit(ReviewLoaded(reviews: reviews));
      } catch (e) {
        emit(ReviewError(message: e.toString()));
      }
    });

    on<ReviewPostReviewEvent>((event, emit) async {
      try {
        await apiDataProvidor.postReview(review: event.review);
        emit(ReviewOperationSuccess(message: 'Review Added'));
      } catch (e) {
        emit(ReviewOperationFailure(message: e.toString()));
      }
    });

    on<ReviewDeleteReviewEvent>((event, emit) async {
      try {
        await apiDataProvidor.deleteReview(reviewId: event.reviewId);
        emit(ReviewOperationSuccess(message: 'Review Deleted'));
      } catch (e) {
        emit(ReviewOperationFailure(message: e.toString()));
      }
    });

    on<ReviewUpdateReviewEvent>((event, emit) async {
      try {
        await apiDataProvidor.updateReview(review: event.review);
        emit(ReviewOperationSuccess(message: 'Review Updated'));
      } catch (e) {
        emit(ReviewOperationFailure(message: e.toString()));
      }
    });
  }
}
