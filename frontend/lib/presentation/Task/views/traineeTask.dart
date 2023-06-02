import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common/loading_paragraph.dart';
import 'package:go_router/go_router.dart';

import '../../../application/Task/task.dart';
import '../../../domain/Task/Model/task_model.dart';

class TraineeTask extends StatelessWidget {
  const TraineeTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: const DatePicker(),
    );
  }
}

class DatePicker extends StatelessWidget {
  final double defaultPadding = 10.0;
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.watch<TaskBloc>();
    List<String> dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      onDateChanged: (DateTime date) {
        taskBloc.add(TaskTraineeLoadingEvent(date: date));

        showDialog(
          context: context,
          builder: (BuildContext context) {
            final taskBlocState = taskBloc.state;

            return AlertDialog(
              title: Card(
                // display the date in the title
                child: Column(
                  children: [
                    Text(dayNames[date.weekday - 1],
                        style: const TextStyle(fontSize: 30)),
                    Text(" ${date.month}/${date.day}/${date.year}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 57, 57, 57))),
                  ],
                ),
              ),
              content: Column(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding - 5)),
                  const Text("Task", style: TextStyle(color: Colors.blue)),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  
                  if (taskBlocState is TaskLoadedSuccessfully)
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final Task taskData = taskBlocState.task.copyWith();
                            taskBloc.add(
                              TaskCompletedToggleEvent(task: taskData),
                            );
                          },
                          child: Icon(
                            taskBlocState.task.isCompleted
                                ? Icons.done_outline_sharp
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            taskBlocState.task.title,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    )
                  // The task title and icon

                  else if (taskBlocState is TaskLoading)
                    Row(
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "Loading Task for this day...",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    )
                  else if (taskBlocState is TaskLoadingError)
                    const Text("Error loading task")
                  else
                    const Text("🏜", style: TextStyle(fontSize: 50.0)),

                  Padding(padding: EdgeInsets.all(defaultPadding)),

                  // The task description
                  const Text(
                    "Description",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  if (taskBlocState is TaskLoading)
                    const LoadingParagraphWidget(
                      numberOfLines: 3,
                      message: "Loading task details.",
                    )
                  else if (taskBlocState is TaskLoadedSuccessfully)
                    Text(taskBlocState.task.description)
                  else if (taskBlocState is TaskLoadingError)
                    TextButton(
                      onPressed: () {
                        taskBloc.add(TaskTraineeLoadingEvent(date: date));
                      },
                      child: const Text("Failed to load task, Reload"),
                    )
                  else if (taskBlocState is TaskIsEmpty)
                    const Text("🏜 Looks like there are no tasks for the day.")
                  else if (taskBlocState is TaskUpdateError)
                    Text(taskBlocState.error)
                  else
                    const Text("Unexpected Error Happened !",
                        style: TextStyle(fontSize: 50.0)),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:
                      const Text("Close", style: TextStyle(color: Colors.blue)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
