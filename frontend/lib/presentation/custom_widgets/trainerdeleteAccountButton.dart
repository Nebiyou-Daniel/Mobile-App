
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/trainer/bloc/trainer_bloc.dart';
import '../../application/trainer/bloc/trainer_event.dart';
import '../../application/trainer/bloc/trainer_state.dart';

class TrainerDeleteAccountButton extends StatelessWidget {
  final String trainerId;

  const TrainerDeleteAccountButton({Key? key, required this.trainerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listen to trainer bloc and add the delete event when the button is pressed
    return BlocListener<TrainerBloc, TrainerState>(
      listener: (context, state) {
        if (state is TrainerDeleteSuccess) {
          // reload trainers list when you go to the previous trainers list page
          context.pop();
        }
      },
      child: ElevatedButton(
        onPressed: () {
          // add delete event to the bloc
          print("Deleted account for trainer $trainerId");
          context.read<TrainerBloc>().add(TrainerDeleteEvent(id: trainerId));
        },
        child: const Text("Delete Account"),
      ),
    );
  }
}
