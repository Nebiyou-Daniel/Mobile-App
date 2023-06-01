import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/UI/common/loading.dart';
import 'package:frontend/trainer/views/trainerDetailPageForAdmin.dart';
import 'package:go_router/go_router.dart';
import '../model/trainer_model.dart';
import '../trainer.dart';

class ListOfTrainers extends StatelessWidget {
  const ListOfTrainers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerBloc>(
      create: (context) => TrainerBloc()..add(const TrainerListLoadEvent()),
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            // a backbtn to go back to the previous page
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: const Text('List of Trainers'),
          ),
          body: BlocBuilder<TrainerBloc, TrainerState>(
            builder: (context, state) {
              if (state is TrainerInitial) {
                BlocProvider.of<TrainerBloc>(context)
                    .add(const TrainerListLoadEvent());
                return const LoadingScreen();
              } else if (state is TrainerListLoading) {
                return const LoadingScreen();
              } else if (state is TrainerListLoadingSuccess) {
                return ListView.builder(
                  itemCount: state.trainerList.length,
                  itemBuilder: (context, index) {
                    return TrainerCard(trainer: state.trainerList[index]);
                  },
                );
              } else if (state is TrainerListLoadingError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return const Text("There are no trainers... ");
            },
          ),
        ),
      ),
    );
  }
}

class TrainerCard extends StatelessWidget {
  const TrainerCard({Key? key, required this.trainer}) : super(key: key);
  final Trainer trainer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          child: Column(children: [
            SizedBox(width: 400, child: Text('Name: ${trainer.name}')),
            SizedBox(
                width: 400, child: Text('Bio: ${trainer.bio}')),
            SizedBox(
                width: 400,
                child: Text('Number of Trainees: ${trainer.numberOfTrainees}')),
            SizedBox(
              width: 400,
              child: RatingBarIndicator(
                rating: double.parse('${trainer.rating}'),
                itemSize: 15,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                direction: Axis.horizontal,
              ),
            ),
          ]),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerDetailForAdmin(
                id: trainer.id.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
