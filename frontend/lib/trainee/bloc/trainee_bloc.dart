// bloc for trainee

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/trainee/bloc/trainee_event.dart';
import 'package:frontend/trainee/bloc/trainee_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../serviceLocator.dart';
import '../data_provider/api_data_providor.dart';
import '../model/trainee_model.dart';

class TraineeBloc extends Bloc<TraineeEvent, TraineeState> {
  TraineeBloc() : super(TraineeInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();
    SharedPreferences preferences = ServiceLocator().preferences;

    on<TraineesListLoadEvent>((event, emit) async {
      try {
        emit(TraineeLoading());

        String accessToken = preferences.getString("access_token")!;
        List<Trainee> traineesList = await apiDataProvider.getTraineeList(
          accessToken: accessToken,
        );

        emit(traineesList.isNotEmpty
            ? TraineeListLoadSuccess(trainees: traineesList)
            : TraineeListEmpty());
      } catch (error) {
        emit(TraineeOperationFailure(error: "$error"));
      }
    });

    on<TraineeDetailLoadEvent>((event, emit) async {
      emit(TraineeLoading());
      try {
        String accessToken = preferences.getString("access_token")!;
        print(event.id);
        Trainee trainee = await apiDataProvider.getTraineeDetail(
            traineeId: event.id, accessToken: accessToken);
        emit(TraineeLoadSuccess(trainee: trainee));
      } catch (error) {
        emit(TraineeOperationFailure(error: "$error"));
      }
    });
  }
}
