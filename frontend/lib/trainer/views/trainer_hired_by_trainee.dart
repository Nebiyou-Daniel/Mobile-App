import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Reviews/review.dart';
import '../../custom_widgets/reviewCard.dart';
import '../trainer.dart';

class TrainerHiredByTrainee extends StatelessWidget {
  const TrainerHiredByTrainee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerInitial) {
          TrainerBloc trainerBloc = BlocProvider.of<TrainerBloc>(context);
          trainerBloc.add(LoadMyTrainer());
        }
        if (state is TrainerLoadSuccess) {
          final trainer = state.trainer;
          return Column(
            children: [
              // Show trainer info here
              Text('Trainer: ${trainer.name}'),
              Text('Trainer ID: ${trainer.id}'),
              Text('Trainer Email: ${trainer.email}'),

              // Add review section
              BlocBuilder<ReviewBloc, ReviewState>(
                builder: (context, state) {
                  if (state is ReviewInitial) {
                    ReviewBloc reviewBloc =
                        BlocProvider.of<ReviewBloc>(context);
                    reviewBloc
                        .add(ReviewGetTraineeReview(trainerId: trainer.id));
                  }
                  if (state is ReviewLoadSuccess) {
                    final review = state.review;
                    // ignore: unnecessary_null_comparison
                    if (review != null) {
                      return Column(
                        children: [
                          // Show existing review
                          ReviewCard(review: review),
                          ElevatedButton(
                            onPressed: () {
                              // Show edit review alert dialog
                              _showEditReviewDialog(context, review);
                            },
                            child: const Text('Edit Review'),
                          ),
                        ],
                      );
                    } else {
                      return ElevatedButton(
                        onPressed: () {
                          // Show add review alert dialog
                          _showAddReviewDialog(context);
                        },
                        child: const Text('Add a Review'),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          );
        } else if (state is TrainerLoadingError) {
          // Show error message or redirect to choose trainer page
          return const Text('Failed to load trainer');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _showEditReviewDialog(BuildContext context, Review review) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Review'),
          content: const Text('Do you want to edit your review?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Perform edit review action
                _editReview(context, review);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Review'),
          content: const Text('Write your review here'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform add review action
                _addReview(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editReview(BuildContext context, Review review) {
    // I will perform an edit review request here by adding an event to the review bloc
    ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);
    // reviewBloc.add();
  }

  void _addReview(BuildContext context) {
    // I will perform an edit review request here
    ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);

  }
}
