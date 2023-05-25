import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker(this.action, {super.key});

  final String action;
  final double defaultPadding = 10.0;

  void taskReader(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Task for the Day"),
            content: const ReadingDialogBox(),
            actions: [
              TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: const Text("Close"))
            ],
          );
        });
  }

  void taskWriter(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Create a Task"),
            content: const WritingDialogBox(),
            actions: [
              TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: const Text("Save Changes")),
              TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: const Text("Close"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(

      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),

      onDateChanged: (DateTime date) {
        if (action == "read") {
          return taskReader(context);

        } else if (action == "write") {
          return taskWriter(context);
        }
      },
    );
  }
}

class WritingDialogBox extends StatelessWidget {
  const WritingDialogBox({super.key});

  final double defaultPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Add task name and write its description"),
        Padding(padding: EdgeInsets.all(defaultPadding)),
        const Text(
          "Task name",
          style: TextStyle(color: Colors.blue),
        ),
        TextField(
          autocorrect: true,
          onChanged: (name) {},
          onSubmitted: (name) {},
        ),
        Padding(padding: EdgeInsets.all(defaultPadding)),
        const Text(
          "Task description",
          style: TextStyle(color: Colors.blue),
        ),
        TextField(
          autocorrect: true,
          onChanged: (name) {},
          onSubmitted: (name) {},
          maxLines: 7,
        ),
      ],
    );
  }
}

class ReadingDialogBox extends StatelessWidget {
  const ReadingDialogBox({super.key});

  final double defaultPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(defaultPadding - 5)),
        const Text(
          "Task",
          style: TextStyle(color: Colors.blue),
        ),
        const Padding(padding: EdgeInsets.all(10.0)),

        const Text(
          "will contain 'TASK NAME' given by the trainer to trainee",
          maxLines: 8,
        ),
        Padding(padding: EdgeInsets.all(defaultPadding)),
        const Text(
          "Details",
          style: TextStyle(color: Colors.blue),
        ),
        const Padding(padding: EdgeInsets.all(10.0)),

        const Text(
          "will contain 'TASK DETAILS' given by the trainer to trainee",
          maxLines: 8,
        )
      ],
    );
  }
}
