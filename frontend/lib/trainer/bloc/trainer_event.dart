abstract class TrainerEvent {
  const TrainerEvent();
}

class TrainerListLoadEvent extends TrainerEvent {
  const TrainerListLoadEvent();
}

class TrainerDetailLoadEvent extends TrainerEvent {
  final int trainerId;
  const TrainerDetailLoadEvent({required this.trainerId});
}

// TrainerDeleteEvent
class TrainerDeleteEvent extends TrainerEvent {
  final String id;
  const TrainerDeleteEvent({required this.id});
}

class LoadMyTrainer extends TrainerEvent {}
