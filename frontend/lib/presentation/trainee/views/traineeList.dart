import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common/loading.dart';
import '../../../domain/trainee/model/trainee_model.dart';
import '../../../application/trainee/trainee.dart';

class ListOfTrainees extends StatelessWidget {
  const ListOfTrainees({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TraineeBloc()..add(TraineesListLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            // a backbtn to go back to the previous page
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: const Text('List of Trainees'),
          ),
          body: BlocBuilder<TraineeBloc, TraineeState>(
            builder: (context, state) {
              if (state is TraineeInitial) {
                BlocProvider.of<TraineeBloc>(context)
                    .add(TraineesListLoadEvent());
                return const LoadingScreen();
              } else if (state is TraineeLoading) {
                return const LoadingScreen();
              } else if (state is TraineeListLoadSuccess) {
                return ListView.builder(
                  itemCount: state.trainees.length,
                  itemBuilder: (context, index) {
                    return TraineeCard(trainee: state.trainees[index]);
                    // return ListTile(
                    //   title: Text(state.trainees[index].name),
                    //   subtitle: Text(state.trainees[index].email),
                    // );
                  },
                );
              } else if (state is TraineeOperationFailure) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return const Text("There are no trainees... ");
            },
          ),
        ),
      ),
    );
  }
}

class TraineeCard extends StatelessWidget {
  const TraineeCard({Key? key, required this.trainee}) : super(key: key);
  final Trainee trainee;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trainee.fullName),
                      Text(trainee.email),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TraineeDetailForAdmin(
                id: trainee.id.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
