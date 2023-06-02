import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common/loading.dart';

import '../../custom_widgets/reviewCard.dart';
import '../../../application/Reviews/review.dart';

// takes trainer id as an argument and listens to the Review bloc and returns a list of reviews widget make it load the review for trainer at initial context using the ..add like this       create: (context) => TraineeBloc()..add(TraineeLoadEvent(id: id)), for example

class ReviewList extends StatelessWidget {
  final int trainerId;
  const ReviewList({super.key, required this.trainerId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewBloc>(
        create: (context) =>
            ReviewBloc()..add(ReviewsGetAllEvent(trainerId: trainerId)),
        child: BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
          print(state);
          if (state is ReviewInitial) {
            // add review loading event to bloc
            BlocProvider.of<ReviewBloc>(context)
                .add(ReviewsGetAllEvent(trainerId: trainerId));
            return const LoadingScreen();
          }
          if (state is ReviewLoadingState) {
            return const LoadingScreen();
          } else if (state is ReviewListLoadSuccess) {

            if (state.reviews.isEmpty) {
              return const Center(
                child: Text('No Reviews yet'),
              );
            }
            return ListView.builder(
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return ReviewCard(review: state.reviews[index]);
              },
            );
          } else if (state is ReviewListLoadError) {
            // refresh button and error message
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("An Error Occured loading reviews!"),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ReviewBloc>(context)
                          .add(ReviewsGetAllEvent(trainerId: trainerId));
                    },
                    child: const Text('Refresh'),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }));
  }
}
