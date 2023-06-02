import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/application/trainee/bloc/trainee_state.dart';
import 'package:frontend/domain/trainee/model/trainee_model.dart';

void main() {
  group('TraineeState', () {
    const List<Trainee> testTrainees = [];
    const String testError = "error msg";
    Trainee trainee = Trainee(
      id: 4,
      fullName: "someone",
      email: "email",
      phone: "phone",
      address: "address",
    );

    group('TraineeState itself', () {
      test('emits [success]', () {
        expect(const TraineeState().props, equals([]));
      });
    });
    group('TraineeInitial', () {
      test('supports value equality', () {
        expect(TraineeInitial(), TraineeInitial());
      });
    });
    group('TraineeLoading', () {
      test('supports value equality', () {
        expect(TraineeLoading(), TraineeLoading());
      });
    });
    group('TraineeListLoadSuccess', () {
      test('emits [success]', () {
        expect(const TraineeListLoadSuccess(trainees: testTrainees),
            const TraineeListLoadSuccess(trainees: testTrainees));
      });
      test('emits [success]', () {
        expect(const TraineeListLoadSuccess(trainees: testTrainees).props,
            equals([testTrainees]));
      });
    });

    group('TraineeOperationFailure', () {
      test('emits [error]', () {
        expect(const TraineeOperationFailure(error: testError),
            const TraineeOperationFailure(error: testError));
      });
      test('emits [error]', () {
        expect(const TraineeOperationFailure(error: testError).props,
            equals(['error msg']));
      });
    });

    group('TraineeAddSuccess', () {
      test('emits [success]', () {
        expect(TraineeAddSuccess(trainee: trainee),
            TraineeAddSuccess(trainee: trainee));
      });
    });

    group('TraineeAddError', () {
      test('emits [error]', () {
        expect(TraineeAddError(error: testError),
            TraineeAddError(error: testError));
      });
      test('emits [error]', () {
        expect(TraineeAddError(error: testError).props, equals(['error msg']));
      });
    });

    group('TraineeListEmpty', () {
      test('supports value equality', () {
        expect(TraineeListEmpty(), TraineeListEmpty());
      });
    });

    group('TraineeLoadSuccess', () {
      test('emits [success]', () {
        expect(TraineeLoadSuccess(trainee: trainee),
            TraineeLoadSuccess(trainee: trainee));
      });
    });

    group('TraineeDeleteSuccess', () {
      test('emits [success]', () {
        expect(TraineeDeleteSuccess(trainee: trainee),
            TraineeDeleteSuccess(trainee: trainee));
      });
    });

    group('TraineesListLoading', () {
      test('supports value equality', () {
        expect(TraineesListLoading(), TraineesListLoading());
      });
    });

    group('TraineesListLoadSuccessEvent', () {
      test('emits [success]', () {
        expect(TraineesListLoadSuccessEvent(trainees: testTrainees),
            TraineesListLoadSuccessEvent(trainees: testTrainees));
      });
      test('emits [success]', () {
        expect(TraineesListLoadSuccessEvent(trainees: testTrainees).props,
            equals(<Trainee>[]));
      });
    });

    group('TraineesListLoadErrorEvent', () {
      test('emits [error]', () {
        expect(TraineesListLoadErrorEvent(message: testError),
            TraineesListLoadErrorEvent(message: testError));
      });
      test('emits [error]', () {
        expect(
            TraineesListLoadErrorEvent(message: testError).props, equals([]));
      });
    });
  });
}
