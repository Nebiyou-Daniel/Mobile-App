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
      ;
    });

    on<GettingTraineeDetailEvent>((event, emit) async {
      try {
        Trainee trainee = await apiDataProvider.getTraineeDetail(event.id);
        emit(TraineeDetailReceivedSuccessfully(trainee: trainee));
      } catch (error) {
        emit(TraineeDetailReceivedError(error: error.toString()));
      }
    });

    // trainer firing a trainee
    on<TraineeRemoveFromTraineeListEvent>((event, emit) async {
      // try to fire the trainee
      try {
        await apiDataProvider.deleteTrainee(event.traineeId);

        // if successull emit a delete success state
        emit(TraineeRemoveFromTraineeListSuccess());
      } catch (error) {
        // else emit a delete error state
        emit(TraineeRemoveFromTraineeListError(error: error.toString()));
      }
    });
    on<TraineeLoadListOfTrainersEvent>((event, emit) async {
      emit(TrainerListLoading());
      await Future.delayed(const Duration(seconds: 3));

      // emit a fake list of trainers
      final List<Trainer> trainers = [
        Trainer(
          id: 1,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 1,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 1,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 1,
          name: "Abdulaziz",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 1,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
      ];
      emit(trainers.isNotEmpty
          ? TrainerListLoadingSuccess(traineeList: trainers)
          : TraineeListEmpty());
    });

    // used in the trainer notifications for new trainee add me requests
    on<TraineeAddToTraineeListSuccessEvent>((event, emit) async {
      // TODO: implement event handler
    });

    on<TraineeAddToTraineeListErrorEvent>((event, emit) async {
      // TODO: implement event handler
    });

    on<TraineeRemoveFromTraineeListSuccessEvent>((event, emit) async {
      // TODO: implement event handler
    });

    on<TraineeRemoveFromTraineeListErrorEvent>((event, emit) async {
      // TODO: implement event handler
    });

    // sorting the trainee list
    on<TraineeSortTrainersEvent>((event, emit) async {
      // emit a loading state and request an api call with sorting parameters
      emit(TrainerListLoading());
      await Future.delayed(const Duration(seconds: 3));
      final List<Trainer> trainers = [
        Trainer(
          id: 2,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 2,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 2,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 2,
          name: "Abdulaziz",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id: 2,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
      ];
      emit(TrainerListLoadingSuccess(
          traineeList: trainers, criteria: event.criteria));
    });
  }
}
