import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/trainee/views/trainee_personal_information.dart';
import 'package:go_router/go_router.dart';
import '../../trainerHiring/trainer_hiring.dart';
import '../trainer.dart';
import 'trainerPersonalInformationPage.dart';

class TraineeDetail extends StatelessWidget {
  final String id;

  const TraineeDetail({Key? key, required this.id}) : super(key: key);

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

      // what I want to do here is to add a button for the admin to delete the trainer's account
      // That shuould popup a dialog box to confirm the deletion for the admin.
      // If the admin confirms the deletion, the trainer's account should be deleted and the admin should be redirected to the trainer's list page.
      // If the admin cancels the deletion, the dialog box should be closed.
      // The admin should be able to delete the trainer's account from the trainer's detail page.
      // This ismust be achieved using the Trainer Bloc and the Trainer Event.

      final trainer = (state as TrainerLoadingSuccess).trainer;
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
        body: TrainerPersonalInformation(id: int.parse(id)),
      );
    });
  }
}
