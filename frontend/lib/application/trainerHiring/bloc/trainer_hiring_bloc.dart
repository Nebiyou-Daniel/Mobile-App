


import 'package:flutter_bloc/flutter_bloc.dart';

import '../trainer_hiring.dart';



class TrainerHiringBloc extends Bloc<TrainerHiringEvent, TrainerHiringState> {
  TrainerHiringBloc() : super(TrainerHiringInitial()) {
    on<TrainerHiringLoadEvent>((event, emit) {
      // here we try to determine if the trainer is hired or not for the current user
      // if the trainer is hired, we emit TrainerHiringLoaded of true
      // else we emit TrainerHiringLoaded of false

    });



    on<TrainerHiringFireEvent>((event, emit) {
      // here we try to fire the trainer
      // if successfull we emit TrainerHiringLoaded of false and show a snackbar
      // else we emit TrainerHiringError and show a snackbar

    });


    on<TrainerHiringHireEvent>((event, emit) {
      // here we try to hire the trainer
      // if successfull we emit TrainerHiringLoaded of true and show a snackbar
      // else we emit TrainerHiringError and show a snackbar

    });
  }
}