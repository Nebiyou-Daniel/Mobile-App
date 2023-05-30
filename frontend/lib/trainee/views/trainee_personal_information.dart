import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:frontend/trainee/bloc/trainee_bloc.dart';
import 'package:frontend/trainee/bloc/trainee_event.dart';
import 'package:frontend/trainee/bloc/trainee_state.dart';

class TraineePersonalInformation extends StatelessWidget {
  final int id;

  const TraineePersonalInformation({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TraineeBloc>(
      create: (context) => TraineeBloc()..add(TraineeLoadEvent(id: id)),
      child: BlocBuilder<TraineeBloc, TraineeState>(
        builder: (context, state) {
          final traineeBloc = context.watch<TraineeBloc>();

          if (state is TraineeInitial) {
            traineeBloc.add(TraineeLoadEvent(id: id));
            return const Center(
              child: LoadingParagraphWidget(
                numberOfLines: 13,
                message: "Loading trainee...",
              ),
            );
          }

          if (state is TraineeLoading) {
            return const Center(
              child: LoadingParagraphWidget(
                numberOfLines: 13,
                message: "Loading trainee...",
              ),
            );
          } else if (state is TraineeLoadSuccess) {
            print("Trainee load success");
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // an initial avatar based on the initial of the trainee name
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      state.trainee.name.length == 2
                          ? state.trainee.name[0] + state.trainee.name[1]
                          : state.trainee.name[0],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(state.trainee.name),
                  Text(state.trainee.phone),
                  Text(state.trainee.email),
                  Text(state.trainee.address),
                  
                ],
              ),
            );
          } else {
            print("Failed to load trainee");
            return const Center(
              child: Text('👀 Failed to load Trainee...'),
            );
          }
        },
      ),
    );
  }
}