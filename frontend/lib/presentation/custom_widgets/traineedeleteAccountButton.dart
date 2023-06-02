
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/trainee/bloc/trainee_bloc.dart';
import '../../application/trainee/bloc/trainee_event.dart';
import '../../application/trainee/bloc/trainee_state.dart';

class TraineeDeleteAccountButton extends StatelessWidget {
  final String traineeId;

  const TraineeDeleteAccountButton({Key? key, required this.traineeId})
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
          print("Deleted account for trainee $traineeId");
          context.read<TraineeBloc>().add(TraineeDeleteEvent(id: traineeId));
        },
        child: const Text("Delete Account"),
      ),
    );
  }
}
