import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/date_picker.dart';
import 'package:frontend/custom_widgets/line_chart.dart';

class WorkoutPlanCreationPage extends StatefulWidget {
  const WorkoutPlanCreationPage({super.key});

  @override
  State<WorkoutPlanCreationPage> createState() =>
      WorkoutPlanCreationPageState();
}

class WorkoutPlanCreationPageState extends State<WorkoutPlanCreationPage> {
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
    return MaterialApp(
      title: "Workout Plan Creation Page",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Workout Plan Creation"),
          ),
          body: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "To create tasks, select a certain date from the calendar below. After a pop-up shows up, write in a task name such as 'Workout Plan' or 'Diet Plan' \nAfterwards, type in a detailed description of your task in the space provided and save the changes.",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Row(children: [
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    const Text(
                        "Pick a Date:"), // THIS IS BECAUSE THE TEXT KEPT ALIGNING CENTER FOR SOME REASON
                  ]),

                  const CustomDatePicker("write"),

                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Changes will be saved");
                      },
                      child: const Text("Save Changes")),
                ],
              ),
            );
          })),
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
          style: TextStyle(
            color: Colors.blue
          ),
        ),

        TextField(
          autocorrect: true,
          onChanged: (name){},
          onSubmitted: (name){},
        ),

        Padding(padding: EdgeInsets.all(defaultPadding)),

        const Text(
          "Task description", 
          style: TextStyle(
            color: Colors.blue
          ),
        ),

        TextField(
          autocorrect: true,
          onChanged: (name){},
          onSubmitted: (name){},
          maxLines: 7,
        ),

      ],
    );
  }
}
