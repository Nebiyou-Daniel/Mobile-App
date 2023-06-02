import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/trainee/model/trainee_model.dart';
import 'package:frontend/trainer/trainer.dart';

void main() {
  group('TrainerState', () {
    const List<Trainee> testTrainees = [];
    const String testError = "error msg";
    Trainee trainee = Trainee(
        id: 4,
        name: "someone",
        email: "email",
        phone: "phone",
        address: "address",
        photo: "photo");

    group('TrainerInitial', () {
      test('check to see initialization', () {
        expect(TrainerInitial().props, equals([]));
      });
    });
    group('GettingTraineeList', () {
      test('check to see initialization', () {
        expect(GettingTraineeList().props, equals([]));
      });
    });
    group('GettingTraineeDetail', () {
      test('check to see initialization', () {
        expect(GettingTraineeDetail().props, equals([]));
      });
    });
    group('TraineeListReceivedSuccessfully', () {
      test('check to see initialization', () {
        expect(TraineeListReceivedSuccessfully(traineeList: testTrainees).props,
            equals([]));
      });
    });
    group('TraineeDetailReceivedSuccessfully', () {
      test('check to see initialization', () {
        expect(TraineeDetailReceivedSuccessfully(trainee: trainee).props,
            equals([]));
      });
    });
    group('TraineeListReceivedError', () {
      test('check to see initialization', () {
        expect(TraineeListReceivedError().props, equals([]));
      });
    });
    group('TraineeDetailReceivedError', () {
      test('check to see initialization', () {
        expect(TraineeDetailReceivedError(error: testError).props, equals([]));
      });
    });

    group('TraineeListEmpty', () {
      test('check to see initialization', () {
        expect(TraineeListEmpty().props, equals([]));
      });
    });
    group('TraineeDetailEmpty', () {
      test('check to see initialization', () {
        expect(TraineeDetailEmpty().props, equals([]));
      });
    });
    group('TraineeAddToTraineeList', () {
      test('check to see initialization', () {
        expect(TraineeAddToTraineeList().props, equals([]));
      });
    });
    group('TraineeRemoveFromTraineeList', () {
      test('check to see initialization', () {
        expect(TraineeRemoveFromTraineeList().props, equals([]));
      });
    });
    group('TraineeAddToTraineeListSuccess', () {
      test('check to see initialization', () {
        expect(TraineeAddToTraineeListSuccess().props, equals([]));
      });
    });
    group('TraineeAddToTraineeListError', () {
      test('check to see initialization', () {
        expect(
            TraineeAddToTraineeListError(error: testError).props, equals([]));
      });
    });
    group('TraineeRemoveFromTraineeListSuccess', () {
      test('check to see initialization', () {
        expect(TraineeRemoveFromTraineeListSuccess().props, equals([]));
      });
    });
    group('TraineeRemoveFromTraineeListError', () {
      test('check to see initialization', () {
        expect(TraineeRemoveFromTraineeListError(error: testError).props,
            equals([]));
      });
    });
    group('TrainerListLoading', () {
      test('check to see initialization', () {
        expect(TrainerListLoading().props, equals([]));
      });
    });
    group('TrainerListLoadingError', () {
      test('check to see initialization', () {
        expect(TrainerListLoadingError(error: testError).props, equals([]));
      });
    });
    group('TrainerLoadingError', () {
      test('check to see initialization', () {
        expect(TrainerLoadingError(error: testError).props, equals([]));
      });
    });
  });
}
