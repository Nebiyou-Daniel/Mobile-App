import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/header_banner.dart';
import 'package:frontend/custom_widgets/header_banner_with_icons.dart';

import '../../custom_widgets/profile_form.dart';

class TraineeProfile extends StatelessWidget {
  const TraineeProfile({super.key});

  final String name = "John Doe";
  final String bio = "A passionate developer and a lifelong learner.";
  final String image = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                HeaderBanner(),
                ProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
