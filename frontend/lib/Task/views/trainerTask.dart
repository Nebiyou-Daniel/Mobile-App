import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:go_router/go_router.dart';

import '../Model/task_model.dart';
import '../task.dart';

class TrainerTask extends StatelessWidget {
  final int id;

  const TrainerTask({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: DatePicker(userID: id),
    );
  }
}

class DatePicker extends StatelessWidget {
  final double defaultPadding = 10.0;
  final int userID;

  const DatePicker({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return BlocBuilder<TaskBloc, TaskState>(builder: (context, taskBlocState) {
      final taskBloc = context.watch<TaskBloc>();
      final taskBlocState = taskBloc.state;
      return CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2025),
          onDateChanged: (DateTime date) {
            taskBloc.add(TaskTrainerLoadingEvent(date: date, userId: userID));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Card(
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
                          const Text("Task",
                              style: TextStyle(color: Colors.blue)),
                          const Padding(padding: EdgeInsets.all(10.0)),
                          if (taskBlocState is TaskLoadedSuccessfully)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    final taskData = taskBlocState.task;
                                    final newTaskData =
                                        taskBlocState.task.copyWith(
                                      isCompleted: !taskData.isCompleted,
                                    );
                                    taskBloc.add(
                                      TaskUpdateEvent(task: newTaskData),
                                    );
                                  },
                                  child: Text(
                                    taskBlocState.task.isCompleted
                                        ? "Done"
                                        : "Not Done",
                                    style: TextStyle(
                                      color: taskBlocState.task.isCompleted
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  // make the title a textfield
                                  child: TextField(
                                    controller: TextEditingController(
                                      text: taskBlocState.task.title,
                                    ),
                                    onSubmitted: (String value) {
                                      final taskData = taskBlocState.task;
                                      final newTaskData =
                                          taskBlocState.task.copyWith(
                                        title: value,
                                      );
                                      taskBloc.add(
                                        TaskUpdateEvent(task: newTaskData),
                                      );
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter a title",
                                    ),
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
                            const LoadingParagraphWidget(numberOfLines: 3, message: "Loading Task Description",)
                          else if (taskBlocState is TaskLoadedSuccessfully)
                            TextField(
                              controller: TextEditingController(
                                text: taskBlocState.task.description,
                              ),
                              onSubmitted: (String value) {
                                final taskData = taskBlocState.task;
                                final newTaskData = taskBlocState.task.copyWith(
                                  description: value,
                                );
                                taskBloc.add(
                                  TaskUpdateEvent(task: newTaskData),
                                );
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter a description",
                              ),
                            )
                          // Text(taskBlocState.task.description)
                          else if (taskBlocState is TaskLoadingError)
                            Text(taskBlocState.error)
                          else
                            const Text(
                                "Looks like there are no tasks assigned for this day."),
                        ],
                      ),
                      actions: taskBlocState is TaskIsEmpty
                          ? [
                              TextButton(
                                onPressed: () {
                                  taskBloc.add(
                                    TaskAddEvent(task: Task.fromJson(), userId: -1),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.add, color: Colors.blueAccent),
                                    Text("Add",
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                  ],
                                ),
                              ),
                            ]
                          : [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.close, color: Colors.blue),
                                    Text("Close",
                                        style: TextStyle(color: Colors.blue)),
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(children: const [
                                    Icon(Icons.delete, color: Colors.red),
                                    Text("Delete",
                                        style: TextStyle(color: Colors.red)),
                                  ]))
                            ]);
                });
          });
    });
  }
}
