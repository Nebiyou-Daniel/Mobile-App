abstract class WeightEvent {}

class WeightLoadingEvent extends WeightEvent {
  final int userId;

  WeightLoadingEvent({this.userId = -1});
}

class WeightLoadedSuccessfullyEvent extends WeightEvent {}

class WeightLoadingErrorEvent extends WeightEvent {}

class WeightAddEvent extends WeightEvent {}
