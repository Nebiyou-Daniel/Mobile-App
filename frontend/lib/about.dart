import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({super.key});


    @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget> [
              Text(
                "About Workout Warriors",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,

                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Here we discuss what our app stads for and any questions people may have about it.",
                  softWrap: true,
                  
                ),
              ),
  
              ExpansionTile(
                title: Text("What is workout warriors for?"),
                children:[
                  Text("answer")
                ],
              ),
              ExpansionTile(
                title: Text("How can someone apply to become a Trainer?"),
                children: [
                  Text("answer")
                ],
              ),
              ExpansionTile(
                title: Text("What are all the available pages?"),
                children: [
                  Text("answer"),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
