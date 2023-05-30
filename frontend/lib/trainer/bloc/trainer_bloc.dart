import 'package:flutter_bloc/flutter_bloc.dart';

import '../../trainee/model/trainee_model.dart';
import '../../trainer/bloc/trainer_state.dart';
import '../data_provider/api_data_providor.dart';
import '../model/trainer_model.dart';
import 'trainer_event.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    // getting the list of trainees a trainer has from the baskend
    on<GettingTraineeListEvent>((event, emit) async {
      // send a set request to the backend api
      try {
        List<Trainee> traineeList = await apiDataProvider.getTraineeList();
        if (traineeList.isEmpty) {
          // Sorry trainer you don't have any trainers
          emit(TraineeListReceivedError());
        } else {
          // if we get the result emit a success state
          emit(TraineeListReceivedSuccessfully(traineeList: traineeList));
        }
      } catch (error) {
        // else emit a failure state
        emit(TraineeListReceivedError());
      }
    });

    on<TrainerLoading>((event, emit) async {
      // load the trainer's information and send a trainer object
      try {
        Trainer trainer = await apiDataProvider.getTrainerInformation(event.id);
        emit(TrainerLoadingSuccess(trainer: trainer));
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
          id : 3,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Abdulaziz",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
      ];
      emit(trainers.isNotEmpty
          ? TrainerListLoadingSuccess(trainerList: trainers)
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
          id : 3,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Ahmed",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Abdulaziz",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
        Trainer(
          id : 3,
          name: "Asmaa",
          speciality: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'mafsd@gmail.com',
          phoneNumber: "+123456789"
        ),
      ];
      emit(TrainerListLoadingSuccess(
          trainerList: trainers, criteria: event.criteria));
    });
  }
}
