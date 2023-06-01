import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../custom_widgets/reviewCard.dart';
import '../review.dart';

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
          if (state is ReviewLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ReviewListLoadSuccess) {
            return ListView.builder(
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return ReviewCard(review: state.reviews[index]);
              },
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }));
  }
}
