import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/serviceLocator.dart';
import 'package:frontend/domain/Weight/Model/weight_mode.dart';
import 'package:frontend/Infrastructure/Weight/data_provider/api_data_providor.dart';
import 'package:frontend/application/Weight/bloc/weight_event.dart';
import 'package:frontend/application/Weight/bloc/weight_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightInitial()) {
    ApiDataProvidor apiDataProvider = ApiDataProvidor();
    SharedPreferences preferences = ServiceLocator().preferences;

    on<WeightLoadingEvent>((event, emit) async {
      emit(WeightLoading());
      try {
        List<Weight> weightData;
        // if successfull emit success state
        // if (event.userId == -1) {
        // get access token
        String accessToken = preferences.getString("access_token")!;
        weightData =
            await apiDataProvider.getSelfWeightData(accessToken: accessToken);

        print(weightData.toList());

        Map<double, double> weightDataMap = {};
        for (var i = 0; i < weightData.length; i++) {
          weightDataMap[i.toDouble()] = double.parse(weightData[i].weight);
        }
        // } else {
        // weightData = await apiDataProvider.getWeightData(event.userId);
        // }
        emit(WeightLoadedSuccessfully(weightData: weightDataMap));
      } catch (error) {
        // else emit the error state
        emit(WeightLoadingError(error: error.toString()));
      }
    });

    on<WeightAddEvent>((event, emit) async {
      String accessToken = preferences.getString("access_token")!;

      try {
        await apiDataProvider.addWeightForTrainee(
          weight: event.weightData,
          accessToken: accessToken,
        );
        print("Successfull adding weight");
        emit(WeightOperationSuccess());
        // add a reload event
        add(WeightLoadingEvent());
        print("Added a reload event.");
      } catch (error) {
        emit(WeightLoadingError(error: "Error adding Weight."));
      }
    });
  }
}
