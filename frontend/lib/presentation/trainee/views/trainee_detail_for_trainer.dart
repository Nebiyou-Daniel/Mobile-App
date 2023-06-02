import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/Task/views/trainerTask.dart';
import 'package:frontend/presentation/trainee/views/trainee_personal_information.dart';
import 'package:go_router/go_router.dart';
import '../../common/loading.dart';
import '../../../application/trainer/trainer.dart';
import '../../../application/trainee/trainee.dart';

// a trainee detail page that takes the trainee id as a constuctor
class TraineeDetailForTrainer extends StatelessWidget {
  final String id;
  const TraineeDetailForTrainer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeBloc, TraineeState>(
      builder: (context, state) {
        final traineeBloc = context.watch<TraineeBloc>();
        print(traineeBloc.state);
        if (state is TraineeInitial) {
          traineeBloc.add(TraineeDetailLoadEvent(id: int.parse(id)));
          return const LoadingScreen();
        }
        else if (state is TraineeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TraineeOperationFailure) {
          return const Center(
            child: Text('Error'),
          );
        }
        else if (state is TraineeLoadSuccess) {
          return Scaffold(
            appBar: AppBar(
              // a backbtn to go back to the previous page
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.pop();
                },
              ),
              title: const Text('Trainee Details Page'),
              // a  . . . that drops down a menu that says fire trainee
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                TraineePersonalInformation(trainee: state.trainee),
                TrainerTask(traineeId: int.parse(id)),
              ]),
            ),
          );
        }
        else {
          print(state);
          return const Center(
            child: Text('Unexpected Error'),
          );
        }
      },
    );
  }
}
