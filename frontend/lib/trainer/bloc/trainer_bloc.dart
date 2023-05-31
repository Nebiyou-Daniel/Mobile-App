import 'package:flutter_bloc/flutter_bloc.dart';

import '../../trainee/model/trainee_model.dart';
import '../../trainer/bloc/trainer_state.dart';
import '../data_provider/api_data_providor.dart';
import '../model/trainer_model.dart';
import 'trainer_event.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    on<TrainerListLoadEvent>((event, emit) async {
      emit(TrainerListLoading());
      await Future.delayed(const Duration(seconds: 3));

      // emit a fake list of trainers
      final List<Trainer> trainers = [
        Trainer(
            id: 3,
            name: "Ahmed",
            bio: "Fitness",
            rating: 4.5,
            numberOfTrainees: 10,
            email: 'mafsd@gmail.com',
            phoneNumber: "+123456789"),
        Trainer(
            id: 3,
            name: "Asmaa",
            bio: "Fitness",
            rating: 4.5,
            numberOfTrainees: 10,
            email: 'mafsd@gmail.com',
            phoneNumber: "+123456789"),
        Trainer(
            id: 3,
            name: "Ahmed",
            bio: "Fitness",
            rating: 4.5,
            numberOfTrainees: 10,
            email: 'mafsd@gmail.com',
            phoneNumber: "+123456789"),
        Trainer(
            id: 3,
            name: "Abdulaziz",
            bio: "Fitness",
            rating: 4.5,
            numberOfTrainees: 10,
            email: 'mafsd@gmail.com',
            phoneNumber: "+123456789"),
        Trainer(
            id: 3,
            name: "Asmaa",
            bio: "Fitness",
            rating: 4.5,
            numberOfTrainees: 10,
            email: 'mafsd@gmail.com',
            phoneNumber: "+123456789"),
      ];
      emit(trainers.isNotEmpty
          ? TrainerListLoadingSuccess(trainerList: trainers)
          : TraineeListEmpty());
    });

    on<TrainerDetailLoadEvent>((event, emit) async {
      emit(TrainerLoading());
      await Future.delayed(const Duration(seconds: 3));

      // emit a fake list of trainers
      final Trainer trainer = Trainer(
          id: 3,
          name: "Ahmed",
          bio: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
          email: 'foad@gmail.com',
          phoneNumber: "+123456789");

      emit(trainer != null
          ? TrainerLoadSuccess(trainer: trainer)
          : TrainerLoadingError(error: "failed to load trainer details"));
    });
    // used in the trainer notifications for new trainee add me requests

    on<TrainerDeleteEvent>((event, emit) async {
      emit(TrainerLoading());
      await Future.delayed(const Duration(seconds: 3));

      emit(TrainerLoadSuccess(
        trainer: Trainer(
          id: 1,
          name: "Ahmed",
          email: "ahmed@gmail.com",
          phoneNumber: "+123456789",
          bio: "Fitness",
          rating: 4.5,
          numberOfTrainees: 10,
        ),
      ));
    });
  }
}
