import '../Model/weight_mode.dart';

abstract class WeightEvent {}

class WeightLoadingEvent extends WeightEvent {
  WeightLoadingEvent();
}

class WeightLoadedSuccessfullyEvent extends WeightEvent {}

class WeightLoadingErrorEvent extends WeightEvent {}

class WeightAddEvent extends WeightEvent {
  final Weight weightData;

  WeightAddEvent({required this.weightData});
}
