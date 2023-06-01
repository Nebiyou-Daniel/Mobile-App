import 'package:flutter/material.dart';

class TrainerChoosingPage extends StatefulWidget {
  const TrainerChoosingPage({super.key});

  @override
  State<TrainerChoosingPage> createState() => _TrainerChoosingPageState();
}

class _TrainerChoosingPageState extends State<TrainerChoosingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "app",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFF0A568A),
            appBar: AppBar(title: const Text('Choose your trainer')),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Builder(builder: (context) {
                      return SizedBox(
                        height: 0.8 * MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(20),
                            // itemCount: trainers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return;
                            }),
                      );
                    }),
                  ]),
            )));
  }
}
