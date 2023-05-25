import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/trainer/bloc/trainer_event.dart';
import 'package:frontend/trainer/bloc/trainer_state.dart';
import 'package:meta/meta.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    on<TrainerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
