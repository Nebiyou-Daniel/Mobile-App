import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/trainee/model/trainee_model.dart';
import 'package:frontend/trainer/model/trainer_model.dart';
import 'package:frontend/trainer/trainer.dart';

void main() {
  group('TrainerBloc', () {
    TrainerBloc buildBloc() {
      return TrainerBloc();
    }

    int testId = 1;

    Trainer trainer = Trainer(
        id: 1,
        name: "Asmaa",
        speciality: "Fitness",
        rating: 4.5,
        numberOfTrainees: 10,
        email: 'mafsd@gmail.com',
        phoneNumber: "+123456789");
    
    Trainee trainee = Trainee(
        id: 4,
        name: "someone",
        email: "email",
        phone: "phone",
        address: "address",
        photo: "photo");

    group('constructor', () {
      test('emits TrainerInitial if it works', () {
        expect(buildBloc, returnsNormally);
      });

      test('checks to see if states are the same', () {
        expect(buildBloc().state, equals(TrainerInitial()));
      });
    });
    group('GettingTraineeListEvent', () {
      blocTest(
        'emits TraineeListReceivedError event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(GettingTraineeListEvent()),
        expect: () => [TraineeListReceivedError()],
      );
    });
    group('TrainerLoading', () {
      blocTest(
        'emits TrainerLoading event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TrainerLoading(id: testId)),
        expect: () => [TrainerLoadingSuccess(trainer: trainer)],
      );
    });
    group('GettingTraineeDetailEvent', () {
      blocTest(
        'emits GettingTraineeDetailEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(GettingTraineeDetailEvent(id: testId)),
        expect: () => [TraineeDetailReceivedSuccessfully(trainee: trainee)],
      );      
    });
    group('TraineeRemoveFromTraineeListEvent', () {

      blocTest(
        'emits TraineeRemoveFromTraineeListEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TraineeRemoveFromTraineeListEvent(traineeId: testId)),
        expect: () => [TraineeRemoveFromTraineeListSuccess()],
      );        
    });
    group('TraineeLoadListOfTrainersEvent', () {
      blocTest(
        'emits TraineeLoadListOfTrainersEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TraineeLoadListOfTrainersEvent()),
        expect: () => [TrainerListLoading()],
      );       
    });
    group('TraineeSortTrainersEvent', () {
      blocTest(
        'emits TraineeSortTrainersEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TraineeSortTrainersEvent(criteria: "sth")),
        expect: () => [TrainerListLoading()],
      );        
    });
  });
}
