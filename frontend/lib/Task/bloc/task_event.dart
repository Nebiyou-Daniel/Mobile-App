import '../Model/task_model.dart';

abstract class TaskEvent {}

class TaskLoadingEvent extends TaskEvent {
  final int userId;
  final DateTime date;

  TaskLoadingEvent({required this.date, this.userId = -1});
}

class TaskLoadedSuccessfullyEvent extends TaskEvent {}

class TaskLoadingErrorEvent extends TaskEvent {}

class TaskAddEvent extends TaskEvent {
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

class TaskCompletedToggleEvent extends TaskEvent {}

class TaskAddDummyEvent extends TaskEvent {}
