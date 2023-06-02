import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/trainee/trainee.dart';
import 'package:frontend/trainee/views/trainee_personal_information.dart';
import 'package:go_router/go_router.dart';
import '../../UI/common/loading.dart';
import '../../trainerHiring/trainer_hiring.dart';
import '../trainer.dart';
import 'trainerPersonalInformationPage.dart';

class TrainerDetailForAdmin extends StatelessWidget {
  final String id;

  const TrainerDetailForAdmin({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(builder: (context, state) {
      final trainerBloc = context.watch<TrainerBloc>();

      if (state is TrainerInitial) {
        trainerBloc.add(TrainerDetailLoadEvent(trainerId: int.parse(id)));
        return const LoadingScreen();
      }

      if (state is TrainerLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TrainerLoadingError) {
        return const Center(
          child: Text('Error'),
        );
      } else if (state is TrainerLoadSuccess) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/trainers');
              },
            ),
            title: const Text('Trainer Details Page'),
            actions: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'Fire',
                    child: Text('Fire Trainer'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'Fire') {
                    // Perform action to fire the trainer
                    context
                        .read<TrainerHiringBloc>()
                        .add(TrainerHiringFireEvent(id: int.parse(id)));
                  }
                },
              ),
            ],
          ),
          // the trainer's personal information should be displayed here
          body: TrainerPersonalInformation(trainer: state.trainer),
          bottomNavigationBar: DeleteAccountButton(trainerId: id),
        );
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  }
}

class DeleteAccountButton extends StatelessWidget {
  final String trainerId;

  const DeleteAccountButton({Key? key, required this.trainerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listen to trainee bloc and add the delete event when the button is pressed
    return BlocListener<TraineeBloc, TraineeState>(
      listener: (context, state) {
        if (state is TraineeDeleteSuccess) {
          // reload trainees list when you go to the previous trainees list page
          context.pop();
        }
      },
      child: ElevatedButton(
        onPressed: () {
          // add delete event to the bloc
          print("Deleted account for trainer $trainerId");
          context.read<TraineeBloc>().add(TraineeDeleteEvent(id: trainerId));
        },
        child: const Text("Delete Account"),
      ),
    );
  }
}
