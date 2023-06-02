import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/reviews/bloc/review_bloc.dart';
import 'package:frontend/reviews/bloc/review_state.dart';
import 'package:frontend/reviews/bloc/review_event.dart';
import 'package:frontend/reviews/Model/review_model.dart';
import 'package:bloc_test/bloc_test.dart';
void main(){
  group('Review block',(){
    Review createReview()=>Review(rating:10, comment: "", 
    traineeId: 1, trainerId: 2);
    ReviewBloc buildBloc()=>ReviewBloc();
    group('constructor',(){
      test('returns normally',(){
        expect(buildBloc(),returnsNormally);
      });
      test('has correct initial state',(){
        expect(buildBloc().state,equals(ReviewInitial()));
      });
    });
    group('ReviewsGetAllEvent',(){
      blocTest('emits [success]/[error]',
      build: ()=>buildBloc(),
      act: (bloc)=>bloc.add(ReviewsGetAllEvent(trainerId: 1)),
      wait:const Duration(seconds: 5),
      expect:()=>[isA<ReviewListLoadError>(),isA<ReviewListLoadSuccess>()]
      );
    });

    group('ReviewsCreateEvent',(){
      blocTest('emits [success]/[error]',
      build: ()=>buildBloc(),
      act: (bloc)=>bloc.add(ReviewCreateEvent(review:createReview())),
      wait:const Duration(seconds: 5),
      expect:()=>[isA<ReviewListLoadError>(),isA<ReviewListLoadSuccess>()]
      );
    });

    group('GetTraineeReview',(){
      blocTest('emits [success]/[error]',
      build: ()=>buildBloc(),
      act: (bloc)=>bloc.add(ReviewGetTraineeReview(trainerId: 1)),
      wait:const Duration(seconds: 5),
      expect:()=>[isA<ReviewLoadSuccess>(),isA<ReviewOperationFailure>()]
      );
    });

    group('ReviewDeleteReviewEvent',(){
      // String msg='Review Deleted Successfully';
      blocTest('emitts [opereation success]/[operation failure]',
      build: ()=>buildBloc(),
      act: (bloc)=>bloc.add(ReviewDeleteReviewEvent(reviewId:1)),
      wait:const Duration(seconds: 5),
      expect:()=>[isA<ReviewOperationFailure>(),isA<ReviewOperationSuccess>()]
      );
    });

    group('ReviewsUpdateReviewEvent',(){
      String msg='Review Updated Successfully';
      blocTest('emitts [opereation success]/[operation failure]',
      build: ()=>buildBloc(),
      act: (bloc)=>bloc.add(ReviewUpdateReviewEvent(createReview())),
      wait:const Duration(seconds: 5),
      expect:()=>[isA<ReviewOperationFailure>(),isA<ReviewOperationSuccess>()]
      );
    });
  });
}