import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/initial_avatar.dart';
import 'package:frontend/trainee/model/trainee_model.dart';

class TraineePersonalInformation extends StatelessWidget {
  final Trainee trainee;

  const TraineePersonalInformation({
    required this.trainee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // an initial avatar based on the initial of the trainee fullName
          InitialsAvatar(initials: trainee.fullName ?? ''),
          Text(trainee.fullName ?? 'N/A'),
          Text(trainee.phone ?? 'N/A'),
          Text(trainee.email ?? 'N/A'),
          Text(trainee.address ?? 'N/A'),
        ],
      ),
    );
  }
}
