import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:frontend/trainee/trainee.dart';
import '../trainer.dart';

class TrainerPersonalInformation extends StatelessWidget {
  final int id;

  const TrainerPersonalInformation({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerBloc>(
      create: (context) =>
          TrainerBloc()..add(TrainerDetailLoadEvent(trainerId: id)),
      child: BlocBuilder<TrainerBloc, TrainerState>(
        builder: (context, state) {
          final trainerBloc = context.watch<TrainerBloc>();

          if (state is TrainerInitial) {
            trainerBloc.add(TrainerDetailLoadEvent(trainerId: id));
            return const Center(
              child: LoadingParagraphWidget(
                numberOfLines: 13,
                message: "Loading trainer information...",
              ),
            );
          }

          if (state is TrainerLoading) {
            return const Center(
              child: LoadingParagraphWidget(
                numberOfLines: 13,
                message: "Loading trainee...",
              ),
            );
          } else if (state is TrainerLoadSuccess) {
            print("Trainee load success");
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // an initial avatar based on the initial of the trainee name
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      // if the trainee name if of 2 length the initial will be the first letter of firstname plus last name
                      // else the initial will be the first letter of firstname only
                      state.trainer.name.length == 2
                          ? state.trainer.name[0] + state.trainer.name[1]
                          : state.trainer.name[0],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(state.trainer.name),
                  Text(state.trainer.email),
                  Text(state.trainer.bio),
                  Text(state.trainer.phoneNumber),
                  Text(
                      'Current active Trainees: ${state.trainer.numberOfTrainees}'),

                  // The trainer's rating ***
                  RatingBar.builder(
                    initialRating: state.trainer.rating,
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
          } else {
            print("Failed to load trainee");
            return const Center(
              child: Text('👀 Failed to load Trainer Informaiton...'),
            );
          }
        },
      ),
    );
  }
}
