import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/application/trainer/trainer.dart';
import 'package:frontend/domain/trainee/model/trainee_model.dart';
import 'package:frontend/domain/trainer/model/trainer_model.dart';

void main() {
  group('TrainerBloc', () {
    TrainerBloc buildBloc() {
      return TrainerBloc();
    }

    int testId = 1;

    Trainer trainer = Trainer(
        id: 1,
        fullName: "Asmaa",
        bio: "Fitness",
        averageRating: 4.5,
        numberOfTrainees: 10,
        email: 'mafsd@gmail.com',
        phoneNumber: "+123456789");

    Trainee trainee = Trainee(
      id: 4,
      fullName: "someone",
      email: "email",
      phone: "phone",
      address: "address",
    );

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
        act: (bloc) => bloc.add(const TrainerListLoadEvent()),
        expect: () => [TraineeListReceivedError()],
      );
    });
    group('TrainerLoading', () {
      blocTest(
        'emits TrainerLoading event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TrainerDetailLoadEvent(trainerId: testId)),
        expect: () => [TrainerLoadSuccess(trainer: trainer)],
      );
    });
    group('GettingTrainerDetailEvent', () {
      blocTest(
        'emits GettingTrainerDetailEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(TrainerDetailLoadEvent(trainerId: testId)),
        expect: () => [TrainerLoadSuccess(trainer: trainer)],
      );
    });

    group('TraineeLoadListOfTrainersEvent', () {
      blocTest(
        'emits TraineeLoadListOfTrainersEvent event',
        build: () => TrainerBloc(),
        act: (bloc) => bloc.add(const TrainerListLoadEvent()),
        expect: () => [TrainerListLoading()],
      );
    });
  });
}
