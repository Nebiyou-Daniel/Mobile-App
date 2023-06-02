import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../serviceLocator.dart';
import '../../trainer/bloc/trainer_state.dart';
import '../data_provider/api_data_providor.dart';
import '../model/trainer_model.dart';
import 'trainer_event.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    SharedPreferences preferences = ServiceLocator().preferences;
    ApiDataProvider apiDataProvider = ApiDataProvider();

    on<TrainerListLoadEvent>((event, emit) async {
      emit(TrainerListLoading());
      try {
        final String accessToken = preferences.getString("access_token")!;
        final String role = preferences.getString("role")!;
        List<Trainer> trainers = await apiDataProvider.getAllTrainers(
            accessToken: accessToken, role: role);

        emit(trainers.isNotEmpty
            ? TrainerListLoadingSuccess(trainerList: trainers)
            : TraineeListEmpty());
      } catch (error) {
        emit(TrainerListLoadingError(error: error.toString()));
      }
    });

    on<LoadMyTrainer>((event, emit) async {
      emit(TrainerLoading());
      try {
        await Future.delayed(const Duration(seconds: 3));
        emit(TrainerLoadSuccess(
          trainer: Trainer(
            id: 1,
            fullName: "Ahmed",
            email: "hjdsfhjasd",
            phoneNumber: "+123456789",
            bio: "Fitness",
            averageRating: 4.5,
            numberOfTrainees: 10,
          ),
        ));
      } catch (error) {
        emit(TrainerLoadingError(error: error.toString()));
      }
    });
  }
}
