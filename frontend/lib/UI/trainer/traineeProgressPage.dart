import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/date_picker.dart';
import 'package:frontend/custom_widgets/line_chart.dart';

class TraineeProgressPage extends StatelessWidget {
  const TraineeProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trainee Progress Page",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Trainee Profile"),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // some profile image
                const SizedBox(
                  height: 200,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                // The trainee's name and bio
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Icon(Icons.person),
                    Padding(padding: EdgeInsets.all(15.0)),
                    Expanded(child: Text("Name")),
                  ],
                ),
                // trainee's bio
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Icon(Icons.info),
                    Padding(padding: EdgeInsets.all(15.0)),
                    Expanded(child: Text("Some long bio")),
                  ],
                ),
                // trainee's email
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Icon(Icons.email),
                    Padding(padding: EdgeInsets.all(15.0)),
                    Expanded(child: Text("Email")),
                  ],
                ),
                // trainee's phone number
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Icon(Icons.phone),
                    Padding(padding: EdgeInsets.all(15.0)),
                    Expanded(child: Text("Phone")),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .9,
                  child: WeightLineChart(weightData: {1: 2, 2: 3, 0: 1}),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

                const Text("Tasks"),

                const CustomDatePicker("read"),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create/Edit Tasks"),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
