import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/Reviews/model/review_model.dart';
import 'package:frontend/Reviews/bloc/review_state.dart';
void main(){
  Review createReview()=>Review(rating: 10, comment: "", 
  traineeId: 1, trainerId: 1);
  group('Reviews state',(){
    group('Reviews state, initial',(){
      test("Supports value equality",(){
        expect(ReviewInitial(),equals(ReviewInitial()));
      });
      test("props are correct",(){
        expect(ReviewInitial().props,equals([]));
      });
    });
    group("Reviews state, load success",(){
      List<Review> reviews=[createReview()];
      test("Supports value equality",(){
        expect(ReviewListLoadSuccess(reviews: reviews),
        equals(ReviewListLoadSuccess(reviews: reviews)));
      });
      test("props are correct",(){
        expect(ReviewListLoadSuccess(reviews: reviews).props,
        equals([reviews]));
      });
    });

    group("Reviews state, load error",(){
      test("Supports value equality",(){
        expect(ReviewListLoadError(message: 'error'),
        equals(ReviewListLoadError(message:'error')));
      });
      test("props are correct",(){
        expect(ReviewListLoadError(message:'error').props,
        equals(['error']));
      });
    });

    group("Reviews state, operation failure",(){
      test("Supports value equality",(){
        expect(ReviewOperationFailure(message: 'failure'),
        equals(ReviewOperationFailure(message:'failure')));
      });
      test("props are correct",(){
        expect(ReviewOperationFailure(message:'failure').props,
        equals(['failure']));
      });
    });
    group("Reviews state, Operation success",(){
      test("Supports value equality",(){
        expect(ReviewOperationSuccess(message: 'success'),
        equals(ReviewOperationSuccess(message: 'success')));
      });
      test("props are correct",(){
        expect(ReviewOperationSuccess(message: 'success').props,
        equals(['success']));
      });
    });
  });
}