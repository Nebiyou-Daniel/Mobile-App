import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Task/views/trainerTask.dart';
import 'package:frontend/trainee/views/trainee_personal_information.dart';
import 'package:frontend/weight/views/weight_chart.dart';
import 'package:go_router/go_router.dart';
import '../trainee.dart';

// a trainee detail page that takes the trainee id as a constuctor
class TraineeDetail extends StatelessWidget {
  final String id;
  const TraineeDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeBloc, TraineeState>(
      builder: (context, state) {
        final traineeBloc = context.watch<TraineeBloc>();

        return Scaffold(
          appBar: AppBar(
            // a backbtn to go back to the previous page
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                print("going back to trainee's list");
                // reload trainees list when you go to the previous trainees list page
                traineeBloc.add(TraineesListLoadEvent());
                context.pop();
              },
            ),
            title: const Text('Trainee Details'),
            // a  . . . that drops down a menu that says fire trainee
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Fire Trainee",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
                onSelected: (value) {
                  // if the user selects fire trainee
                  if (value == 1) {
                    // add an event to the bloc to fire the trainee
                    traineeBloc.add(TraineeDeleteEvent(id: id));
                    // reload trainees list when you go to the previous trainees list page
                    traineeBloc.add(TraineesListLoadEvent());
                    context.pop();
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              TraineePersonalInformation(id: int.parse(id)),
              SizedBox(
                height: 200,
                child: WeightChartHandeler(id: int.parse(id)),
              ),
              TrainerTask(id: int.parse(id)),
            ]),
          ),
        );
      },
    );
  }
}
