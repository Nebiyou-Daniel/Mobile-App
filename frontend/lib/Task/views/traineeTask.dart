import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:go_router/go_router.dart';

import '../task.dart';

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
        taskBloc.add(TaskLoadingEvent(date: date, userId: -1));
        showDialog(
          context: context,
          builder: (BuildContext context) {
            final taskBlocState = taskBloc.state;

            return AlertDialog(
              title: Card(
                // Text("${dayNames[date.weekday-1]}  ${date.month}/${date.day}/${date.year}",style: const TextStyle(fontSize: 35)),
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
                            print("Tabbed");
                            final taskData = taskBlocState.task;
                            final newTaskData = taskData.copyWith(
                              isCompleted: !taskData.isCompleted,
                            );
                            taskBloc.add(
                              TaskUpdateEvent(task: newTaskData),
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
                            "Loading...",
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
                    const LoadingParagraphWidget(numberOfLines: 3, message: "Loading task details.",)
                  else if (taskBlocState is TaskLoadedSuccessfully)
                    Text(taskBlocState.task.description)
                  else if (taskBlocState is TaskLoadingError)
                    Text(taskBlocState.error)
                  else
                    const Text("Looks like there are no tasks for the day."),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close", style: TextStyle(color: Colors.blue)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
