abstract class TrainerHiringEvent {}

class TrainerHiringLoadEvent extends TrainerHiringEvent {
  final int id;

  TrainerHiringLoadEvent({required this.id});
}

class TrainerHiringHireEvent extends TrainerHiringEvent {
  final int id;

  TrainerHiringHireEvent({required this.id});
}

class TrainerHiringFireEvent extends TrainerHiringEvent {
  final int id;

  TrainerHiringFireEvent({required this.id});
}
class TrainerHiringUpdateEvent extends TrainerHiringEvent {
  final int id;

  TrainerHiringUpdateEvent({required this.id});
}
