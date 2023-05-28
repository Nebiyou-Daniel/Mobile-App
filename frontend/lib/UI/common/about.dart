import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/header_banner.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({super.key});


    @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: const <Widget> [
              HeaderBanner(),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 8.0),
                child: Text(
                  "About Workout Warriors",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 40,
              
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Here we discuss what our app stads for and any questions people may have about it.",
                  softWrap: true,
                  
                ),
              ),
              Image(
                image: AssetImage('assets/images/img.jpg'),
                height: 350,

              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 25.0),
                child: Text(
                  "Below listed are FAQs and basic explanation of our app",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  
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
                title: Text("What are all the roles that exist?"),
                children: [
                  Text("answer"),
                ],
              ),
              ExpansionTile(
                title: Text("What are all the things that can be done on the app?"),
                children: [
                  Text("answer"),
                ],
              ),
              ExpansionTile(
                title: Text("How secure is my Account (change wording)?"),
                children: [
                  Text("answer"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
              )

            ],
          ),
        ),
      ),
    );
  }
}
