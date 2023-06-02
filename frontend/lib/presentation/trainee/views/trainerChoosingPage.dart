import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../application/Theme/theme.dart';
import '../../../domain/trainer/model/trainer_model.dart';
import '../../../application/trainer/trainer.dart';
import '../../trainer/views/trainerDetailPageForTrainee.dart';

class TrainerChoosingPage extends StatelessWidget {
  const TrainerChoosingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // listen to theme bloc
      theme: context.read<ThemeBloc>().state.theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Choose Trainer'),
        ),
        body: BlocProvider<TrainerBloc>(
          create: (context) => TrainerBloc()..add(const TrainerListLoadEvent()),
          child: BlocBuilder<TrainerBloc, TrainerState>(
            builder: (context, state) {
              final trainerBloc = BlocProvider.of<TrainerBloc>(context);

              if (state is TrainerInitial) {
                trainerBloc.add(const TrainerListLoadEvent());
                return const Center(child: CircularProgressIndicator());
              } else if (state is TrainerListLoadingSuccess) {
                final trainers = state.trainerList;
                return ListView.builder(
                  itemCount: trainers.length,
                  itemBuilder: (context, index) {
                    final trainer = trainers[index];
                    return TrainerCard(trainer: trainer);
                  },
                );
              } else if (state is TrainerListLoadingError) {
                // a button to retry loading trainers
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Failed to load trainers'),
                      ElevatedButton(
                        onPressed: () {
                          trainerBloc.add(const TrainerListLoadEvent());
                        },
                        child: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: Text('Failed to load trainers'));

              // return const SizedBox();
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
      //on clicked navigate to the trainer detail page

      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          child: Column(children: [
            SizedBox(width: 400, child: Text('Name: ${trainer.fullName}')),
            SizedBox(width: 400, child: Text('Speciality: ${trainer.bio}')),
            SizedBox(
                width: 400,
                child: Text('Number of Trainees: ${trainer.numberOfTrainees}')),
            SizedBox(
              width: 400,
              child: RatingBarIndicator(
                rating: double.parse('${trainer.averageRating}'),
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
          // the detail page of the current trainer selected
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerDetailForTrainee(id: trainer.id),
            ),
          );
        },
      ),
    );
  }
}
