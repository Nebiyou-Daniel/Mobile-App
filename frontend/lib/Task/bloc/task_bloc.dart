import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Task/bloc/task_event.dart';
import 'package:frontend/Task/bloc/task_state.dart';
import 'package:frontend/Task/data_provider/api_data_provider.dart';
import 'package:frontend/Task/Model/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../serviceLocator.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    // loading task for trainee, need to pass trainee id and date
    on<TaskTrainerLoadingEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final String accessToken = preferences.getString("access_token")!;
        print(event.date.toString());
        final _task = await apiDataProvider.getTaskData(
            traineeId: event.userId,
            date: event.date.toString(),
            accessToken: accessToken);

        emit(TaskLoadedSuccessfully(task: _task));
      } catch (error) {
        emit(TaskLoadingError(error: error.toString()));
      }
    });

    // loading task for trainee, need to pass date.
    on<TaskTraineeLoadingEvent>((event, emit) async {
      try {
        final String accessToken = preferences.getString("access_token")!;
      } catch (error) {}
    });

    on<TaskAddEvent>((event, emit) async {
      emit(TaskLoading());

      try {
        final String accessToken = preferences.getString("access_token")!;
        await apiDataProvider.createTask(
            task: event.task, accessToken: accessToken);
        emit(TaskAddSuccess(task: event.task));
        add(TaskTrainerLoadingEvent(
            userId: event.userId, date: event.task.date));
      } catch (error) {
        emit(TaskAddError(error: error.toString()));
      }
    });

    on<TaskUpdateEvent>((event, emit) async {
      emit(TaskLoading());

      try {
        final String accessToken = preferences.getString("access_token")!;
        await apiDataProvider.updateTask(
            task: event.task, accessToken: accessToken);
      } catch (error) {
        emit(TaskUpdateError(error: error.toString()));
        return;
      }
      emit(TaskLoadedSuccessfully(task: event.task));
    });

    on<TaskDeleteEvent>((event, emit) async {
      emit(TaskLoading());
      print("delete event");

      try {
        final String accessToken = preferences.getString("access_token")!;

        await apiDataProvider.deleteTask(
            taskId: event.task.id, accessToken: accessToken);
      } catch (error) {
        emit(TaskDeleteError(error: error.toString()));
      }
      emit(TaskInitial());
    });

    on<TaskCompletedToggleEvent>((event, emit) async {
      emit(TaskLoading());

      try {
        final String accessToken = preferences.getString("access_token")!;
        Task updatedTask = event.task;
        updatedTask.isCompleted = !updatedTask.isCompleted;
        await apiDataProvider.setAsDone(
            task: updatedTask, accessToken: accessToken);

        emit(TaskLoadedSuccessfully(task: updatedTask));
      } catch (error) {
        // else emit the error state
        emit(TaskDeleteError(error: error.toString()));
      }
      emit(TaskInitial());
    });
  }
}
