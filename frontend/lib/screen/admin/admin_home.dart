import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/custom_widgets/header_banner.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: const Text('Admin Home page')
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 0.35 * MediaQuery.of(context).size.height,
                        child: const HeaderBanner()),
                      SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => print('list of trainees selected'),
                          child: const Text('List of All Trainees')
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => print('list of trainers selected'),
                          child: const Text('List of All Trainers')
                          ),
                        ),
                      ),
                    ],
                  ),
                );
          }
        ),
          ),
    );
      
  }
}