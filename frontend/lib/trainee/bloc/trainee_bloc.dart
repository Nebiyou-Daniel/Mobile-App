// bloc for trainee

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/trainee/bloc/trainee_event.dart';
import 'package:frontend/trainee/bloc/trainee_state.dart';

import '../data_provider/api_data_providor.dart';
import '../model/trainee_model.dart';

class TraineeBloc extends Bloc<TraineeEvent, TraineeState> {
  TraineeBloc() : super(TraineeInitial()) {
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
