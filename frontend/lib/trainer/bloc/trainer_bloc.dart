import 'package:flutter_bloc/flutter_bloc.dart';

import '../../trainee/model/trainee_model.dart';
import '../../trainer/bloc/trainer_state.dart';
import '../data_provider/api_data_providor.dart';
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
  }
}
