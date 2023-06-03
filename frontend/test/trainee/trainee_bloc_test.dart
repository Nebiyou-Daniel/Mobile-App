import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/trainee/bloc/trainee_bloc.dart';
import 'package:frontend/trainee/trainee.dart';

void main() {
  group('TraineeBloc', () {
    TraineeBloc buildBloc() {
      return TraineeBloc();
    }

    int testId = 1;

    group('constructor', () {
      test('emits TraineeInitial if it works', () {
        expect(buildBloc, returnsNormally);
      });

      test('checks to see if states are the same', () {
        expect(buildBloc().state, equals(TraineeInitial()));
      });
    });

    group('TraineeListLoadEvent', () {
      blocTest(
        'emits TraineeLoading event',
        build: () => TraineeBloc(),
        act: (bloc) => bloc.add(TraineesListLoadEvent()),
        expect: () => [TraineeLoading()],
      );
    });

    group('TraineeLoadEvent', () {
      blocTest(
        'emits traineeLoading Event',
        build: () => TraineeBloc(),
        act: (bloc) => bloc.add(TraineeLoadEvent(id: testId)),
        expect: () => TraineeLoading(),
      );
    });
    group('TraineeDeleteEvent', () {
      blocTest(
        'emits traineeLoading Event',
        build: () => TraineeBloc(),
        act: (bloc) => bloc.add(TraineeDeleteEvent(id: testId)),
        expect: () => TraineeLoading(),
      );
    });
  });
}
