import 'package:fl_chart/fl_chart.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
              ),
              Row(
                children: const [
                  Padding(padding: EdgeInsets.all(15.0)),
                  Icon(Icons.person),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Expanded(child: Text("Name")),
                ],
              ),

              Row(
                children: const [
                  Padding(padding: EdgeInsets.all(15.0)),
                  Icon(Icons.info),
                  Padding(padding: EdgeInsets.all(15.0)),                  
                  Expanded(child: Text("Some long bio")),
                ],
              ),

              Row(
                children: const [
                  Padding(padding: EdgeInsets.all(15.0)),
                  Icon(Icons.email),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Expanded(child: Text("Email")),
                ],
              ),

              Row(
                children: const [
                  Padding(padding: EdgeInsets.all(15.0)),
                  Icon(Icons.phone),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Expanded(child: Text("Phone")),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

              const Text(
                "TWO LINE CHARTS GO IN HERE, LEFT OUT FOR NOW OUT OF NECESSITY",
                style: TextStyle(
                  backgroundColor: Colors.amber,
                ),
              ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

              const Text("Tasks"),

              const CustomDatePicker("read"),

              ElevatedButton(
                onPressed: (){

                }, 
                child: const Text("Create/Edit Tasks"),
              ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

            ],
          ),
        ),
      ),
    );
  }
}
