import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/header_banner.dart';
import 'package:go_router/go_router.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Admin Home page')),
        body: Builder(builder: (context) {
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
                    child: ElevatedButton(
                        // list of all trainees
                        onPressed: () => context.go('/admin/trainees'),
                        child: const Text('List of All Trainees')),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => context.go('/admin/trainers'),
                        child: const Text('List of All Trainers')),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
