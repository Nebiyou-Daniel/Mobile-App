import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Reviews/views/trainerListOfReviews.dart';
import '../../trainee/views/trainee_personal_information.dart';
import '../../trainerHiring/trainer_hiring.dart';
import '../trainer.dart';

class TrainerDetailForTrainee extends StatelessWidget {
  final int id;

  const TrainerDetailForTrainee({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(builder: (context, state) {
      if (state is TrainerLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TrainerLoadingError) {
        return const Center(
          child: Text('Error'),
        );
      }
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text('Trainer Details Page'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          TraineePersonalInformation(id: id),
          ReviewList(trainerId: id),
        ])),
        // bottomNavigationBar: TrainerHiringButton(id: id),
      );
    });
  }
}

class TrainerHiringButton extends StatelessWidget {
  final int id;
  const TrainerHiringButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// listen to the TrainerHiringBloc
    return BlocBuilder<TrainerHiringBloc, TrainerHiringState>(
        builder: (context, state) {
      if (state is TrainerHiringLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TrainerHiringError) {
        return const Center(
          child: Text('Error', style: TextStyle(color: Colors.red)),
        );
      } else if (state is TrainerHiringLoaded) {
        if (state.isHired) {
          return ElevatedButton(
            onPressed: () {
              // add to the bloc to fire the trainee
              context
                  .read<TrainerHiringBloc>()
                  .add(TrainerHiringFireEvent(id: id));
            },
            child: const Text('Fire Trainee'),
          );
        } else {
          return ElevatedButton(
            onPressed: () {
              // add to the bloc to hire the trainee
              context
                  .read<TrainerHiringBloc>()
                  .add(TrainerHiringHireEvent(id: id));
            },
            child: const Text('Hire Trainer'),
          );
        }
      }
      return const Center(
        child: Text('Error loading the button'),
      );
    });
  }
}
