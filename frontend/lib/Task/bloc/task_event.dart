import '../Model/task_model.dart';

abstract class TaskEvent {}

class TaskTrainerLoadingEvent extends TaskEvent {
  final int userId;
  final DateTime date;

  TaskTrainerLoadingEvent({required this.date, required this.userId});
}

class TaskTraineeLoadingEvent extends TaskEvent {
  final DateTime date;

  TaskTraineeLoadingEvent({required this.date});
}

class TaskAddEvent extends TaskEvent {
  // no need to add date as the date is the current date to be added.
  final Task task;
  final int userId;

  TaskAddEvent({required this.task, required this.userId});
}

class TaskDeleteEvent extends TaskEvent {
  final Task task;
  TaskDeleteEvent({required this.task});
}

class TaskUpdateEvent extends TaskEvent {
  final Task task;
  TaskUpdateEvent({required this.task});
}


class TaskCompletedToggleEvent extends TaskEvent {

  final Task task;
  TaskCompletedToggleEvent({required this.task});
}

