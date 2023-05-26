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
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
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


                  SizedBox(
                    height: MediaQuery.of(context).size.height*.3,
                    width: MediaQuery.of(context).size.width*.9,
                    child: WeightLineChart('sixMonth'),
                  ),

                  Container( 
                    child: DropdownButton(
                      
                      items: const [
                        DropdownMenuItem(
                          value: "oneMonth",
                          child: Text("One Month"),
                        ),
                        DropdownMenuItem(
                          value: "sixMonth",
                          child: Text("Six Months"),
                        ),
                        DropdownMenuItem(
                          value: "oneYear",
                          child: Text("One Year"),
                        ),
                      ],
                      onChanged: (value){},
                    )
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
            );
          }
        ),
      ),
    );
  }
}
