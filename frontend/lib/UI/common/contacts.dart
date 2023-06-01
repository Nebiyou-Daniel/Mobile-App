import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Theme/theme.dart';

class ContactsUsPage extends StatelessWidget {
  const ContactsUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeBloc>().state.theme,
      title: "Contacts",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Contact Us"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: ContactsHome(),
        ),
      ),
    );
  }
}

class ContactsHome extends StatelessWidget {
  const ContactsHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.info,
              color: Colors.blue[600],
              size: 50,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                "Welcome to Workout Warrior",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 30,
                  fontFamily: 'Verdana',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          children: [
            Icon(Icons.star, color: Colors.blue[600]),
            const SizedBox(width: 10),
            Text(
              'Email: info@workoutwarrior.com',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontFamily: 'Verdana',
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          children: [
            Text(
              "Address:",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: const Color.fromARGB(255, 155, 210, 255),
                ),
              ),
              child: const Text(
                "123 Gym Street, Fitness City",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Verdana',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
