import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  final double defaultPadding = 10.0;

  void taskWriter(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Create a Task"),
            content: const DialogBox(),
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

      onDateChanged: (DateTime a) {
        return taskWriter(context);
      },
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

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
