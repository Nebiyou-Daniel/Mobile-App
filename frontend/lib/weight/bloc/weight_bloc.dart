// the bloc for weight data for user

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/weight/data_provider/api_data_providor.dart';
import 'package:frontend/weight/bloc/weight_event.dart';
import 'package:frontend/weight/bloc/weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightInitial()) {
    ApiDataProvidor apiDataProvider = ApiDataProvidor();

    on<WeightLoadingEvent>((event, emit) async {
      emit(WeightLoading());
      try {
        Map<double, double> weightData;
        // if successfull emit success state
        if (event.userId == -1) {
          weightData = await apiDataProvider.getSelfWeightData();
        } else {
          weightData = await apiDataProvider.getWeightData(event.userId);
        }
        emit(WeightLoadedSuccessfully(weightData: weightData));
      } catch (error) {
        // else emit the error state
        emit(WeightLoadingError(error: error.toString()));
      }
    });

    on<WeightAddEvent>((event, emit) {});
  }
}
