import 'package:bloc/bloc.dart';
import 'package:frontend/trainee/bloc/trainee_event.dart';
import 'package:frontend/trainee/bloc/trainee_state.dart';
import 'package:meta/meta.dart';


class TraineeBloc extends Bloc<TraineeEvent, TraineeState> {
  TraineeBloc() : super(TraineeInitial()) {
    on<TraineeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
