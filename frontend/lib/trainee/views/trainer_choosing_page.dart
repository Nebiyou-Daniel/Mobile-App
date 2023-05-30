import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../UI/common/loading_paragraph.dart';
import '../../trainer/trainer.dart';

class TrainerChoosingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your trainer'),
      ),
      body: BlocBuilder<TrainerBloc, TrainerState>(
        builder: (context, state) {
          final trainerBloc = context.watch<TrainerBloc>();

          if (state is TrainerInitial) {
            trainerBloc.add(TraineeLoadListOfTrainersEvent()); // Load trainers
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrainerListLoading) {
            return const Center(
                child: LoadingParagraphWidget(numberOfLines: 3));
          }

          if (state is TrainerListLoadingSuccess) {
            final trainers = state.traineeList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: DropdownButton<String>(
                    hint: const Text("Sort by"),
                    items: ['Rating', 'No of Trainees'].map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Sort trainers based on the selected value
                      trainerBloc
                          .add(TraineeSortTrainersEvent(criteria: value!));
                    },
                    value: state.criteria,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: trainers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final trainer = trainers[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        height: 80,
                        child: TextButton(
                          onPressed: () {
                            // Redirect to trainer detail page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      // TrainerDetailPage(trainer: trainer),
                                      const Text('Dummy Trainer Detail Page'),
                                ));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: 400,
                                child: Text('Name: ${trainer.name}'),
                              ),
                              SizedBox(
                                width: 400,
                                child:
                                    Text('Speciality: ${trainer.speciality}'),
                              ),
                              SizedBox(
                                width: 400,
                                child: Text(
                                  'Number of Trainees: ${trainer.numberOfTrainees}',
                                ),
                              ),
                              SizedBox(
                                width: 400,
                                child: RatingBarIndicator(
                                  rating: trainer.rating,
                                  itemSize: 15,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          if (state is TrainerListLoadingError) {
            return Column(
              children: [
                const Text('Failed to load trainers.'),
                ElevatedButton(
                  onPressed: () {
                    // Retry loading trainers
                    trainerBloc.add(TraineeLoadListOfTrainersEvent());
                  },
                  child: const Text('Retry'),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Go to previous page
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              // Go to next page
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
