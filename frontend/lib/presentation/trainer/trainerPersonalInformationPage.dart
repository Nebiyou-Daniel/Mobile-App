import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/application/trainee/trainee.dart';
import '../../domain/trainer/model/trainer_model.dart';
import '../../application/trainer/trainer.dart';

class TrainerPersonalInformation extends StatelessWidget {
  final Trainer trainer;

  const TrainerPersonalInformation({
    required this.trainer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // an initial avatar based on the initial of the trainer name
          CircleAvatar(
            radius: 50,
            child: Text(
              // if the trainer name if of 2 length the initial will be the first letter of firstname plus last name
              // else the initial will be the first letter of firstname only
              trainer.fullName.length == 2
                  ? trainer.fullName[0] + trainer.fullName[1]
                  : trainer.fullName[0],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(trainer.fullName),
          Text(trainer.email),
          Text(trainer.bio!),
          Text(trainer.phoneNumber!),
          Text('Current active Trainees: ${trainer.numberOfTrainees}'),

          // The trainer's rating ***
          RatingBar.builder(
            initialRating: trainer.averageRating,
            itemSize: 15,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // do nothing
            },
          )
        ],
      ),
    );
  }
}
