import 'package:equatable/equatable.dart';
import 'package:frontend/application/Task/task.dart';

import '../../../domain/task/Model/task_model.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoadedSuccessfully extends TaskState {
  final Task task;

  const TaskLoadedSuccessfully({required this.task});

  @override
  List<Object> get props => [task];
}

class TaskLoadingError extends TaskState {
  final String error;

  const TaskLoadingError({required this.error});

  @override
  List<Object> get props => [error];
}

class TaskAdd extends TaskState {}

class TaskAddError extends TaskState {
  final String error;

  const TaskAddError({required this.error});

  @override
  List<Object> get props => [error];
}

class TaskAddSuccess extends TaskState {
  final Task task;
    const TaskAddSuccess({required this.task});

}

class TaskDelete extends TaskState {}

class TaskDeleteError extends TaskState {
  final String error;

  const TaskDeleteError({required this.error});

  @override
  List<Object> get props => [error];
}

// empty task
class TaskIsEmpty extends TaskState {}

class TaskDeleteSuccess extends TaskState {}


class TaskUpdateError extends TaskState {
  final String error;

  const TaskUpdateError({required this.error});

  @override
  List<Object> get props => [error];
}

class TaskUpdateSuccess extends TaskState {}
