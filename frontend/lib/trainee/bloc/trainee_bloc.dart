// bloc for trainee

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/trainee/bloc/trainee_event.dart';
import 'package:frontend/trainee/bloc/trainee_state.dart';

import '../../trainer/model/trainer_model.dart';
import '../data_provider/api_data_providor.dart';
import '../model/trainee_model.dart';

class TraineeBloc extends Bloc<TraineeEvent, TraineeState> {
  TraineeBloc() : super(TraineeInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    // on<TraineeLoadEvent>((event, emit) async {
    //   emit(TraineeLoading());

    //   try {
    //     final trainees = await apiDataProvider.getTraineeList();
    //     emit(TraineeLoadSuccess(trainees: trainees));
    //   } catch (error) {
    //     // else emit the error state
    //     emit(TraineeOperationFailure(error: "Error: ${error.toString()}"));
    //   }
    // });

    on<TraineeLoadEvent>((event, emit) async {
      emit(TraineeLoading());
      await Future.delayed(const Duration(seconds: 3));

      emit(TraineeLoadSuccess(
        trainee: Trainee(
          id: 1,
          name: "Ahmed",
          email: "ahmed@gmail.com",
          phone: "+251988173671",
          address: "22 iraq street",
          photo: "This is a fake photo",
        ),
      ));
    });

    on<TraineeDeleteEvent>((event, emit) async {
      emit(TraineeLoading());
      await Future.delayed(const Duration(seconds: 3));

      // emit(TraineeOperationSuccess());
    });

  }
}
