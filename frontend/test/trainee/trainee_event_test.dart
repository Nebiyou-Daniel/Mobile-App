import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/trainee/trainee.dart';

void main() {
  group('TraineeEvent', () {
    const int testId = 1;
    group('TraineeListLoadEvent', () {
      test('return instance', () {
        expect(TraineesListLoadEvent(), TraineesListLoadEvent());
      });
    });

    group('TraineeLoadEvent', () {
      test('return instance', () {
        expect(TraineesListLoadEvent(), TraineesListLoadEvent());
      });      
    });

    group('TraineeDeleteEvent', () {
      test('return instance', () {
        expect(TraineeDeleteEvent(id: testId), TraineeDeleteEvent(id: testId));
      });      
    });
  });
}
