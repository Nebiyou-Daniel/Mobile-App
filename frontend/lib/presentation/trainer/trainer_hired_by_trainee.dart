import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common_screens/loading.dart';
import 'package:go_router/go_router.dart';
import '../../application/Reviews/review.dart';
import '../custom_widgets/reviewCard.dart';
import '../../application/trainer/trainer.dart';

class TrainerHiredByTrainee extends StatelessWidget {
  const TrainerHiredByTrainee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        print(state);
        if (state is TrainerInitial) {
          TrainerBloc trainerBloc = BlocProvider.of<TrainerBloc>(context);
          trainerBloc.add(LoadMyTrainer());
          return const LoadingScreen();
        }
        if (state is TrainerLoadSuccess) {
          final trainer = state.trainer;
          return Column(
            children: [
              // Show trainer info here
              Text('Trainer: ${trainer.fullName}'),
              Text('Trainer ID: ${trainer.id}'),
              Text('Trainer Email: ${trainer.email}'),
              // change trainer button that redirects you to choose trainer page
              ElevatedButton(
                onPressed: () {
                  context.go('/trainee/chooseTrainer');
                },
                child: const Text('Change Trainer'),
              ),

              // Add review section
              BlocBuilder<ReviewBloc, ReviewState>(
                builder: (context, state) {
                  print(state);
                  if (state is ReviewInitial) {
                    ReviewBloc reviewBloc =
                        BlocProvider.of<ReviewBloc>(context);
                    reviewBloc
                        .add(ReviewGetTraineeReview(trainerId: trainer.id));
                    return const LoadingScreen();
                  } else if (state is ReviewLoadSuccess) {
                    final review = state.review;
                    return Column(
                      children: [
                        Container(height: 10),
                        // Show existing review
                        ReviewCard(review: review),
                        Container(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Show edit review alert dialog
                            _showEditReviewDialog(context, review);
                          },
                          child: const Text('Edit Review'),
                        ),
                        Container(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Show delete review alert dialog
                            _showDeleteReviewDialog(context, review);
                          },
                          child: const Text('Delete Review'),
                        ),
                        Container(height: 10),
                      ],
                    );
                  } else if (state is ReviewEmpty) {
                    return ElevatedButton(
                      onPressed: () {
                        // Show add review alert dialog
                        _showAddReviewDialog(context);
                      },
                      child: const Text('Add a Review'),
                    );
                  } else if (state is ReviewLoadingState) {
                    return const LoadingScreen();
                  } else {
                    return const Text('Failed to load review');
                  }
                },
              ),
            ],
          );
        } else if (state is TrainerLoadingError) {
          // Show error message or redirect to choose trainer page
          return const Text('Failed to load trainer');
        } else {
          return const LoadingScreen();
        }
      },
    );
  }

  void _showEditReviewDialog(BuildContext context, Review review) {
    showDialog(
      context: context,
      builder: (context) {
        return _EditReviewDialog(review: review);
      },
    );
  }

  void _showDeleteReviewDialog(BuildContext context, Review review) {
    showDialog(
      context: context,
      builder: (context) {
        return _DeleteReviewDialog(review: review);
      },
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _AddReviewDialog();
      },
    );
  }
}

class _EditReviewDialog extends StatefulWidget {
  final Review review;

  const _EditReviewDialog({Key? key, required this.review}) : super(key: key);

  @override
  _EditReviewDialogState createState() => _EditReviewDialogState();
}

class _EditReviewDialogState extends State<_EditReviewDialog> {
  late TextEditingController _reviewEditingController;
  late int _rating;

  @override
  void initState() {
    super.initState();
    _reviewEditingController =
        TextEditingController(text: widget.review.comment);
    _rating = widget.review.rating;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Review'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _reviewEditingController,
            decoration: const InputDecoration(
              hintText: 'Write your review here',
            ),
          ),
          const SizedBox(height: 10),
          Text('Rating: $_rating'),
          Slider(
            value: _rating.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (newRating) {
              setState(() {
                _rating = newRating.toInt();
              });
            },
          ),
        ],
      ),
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
            // Perform edit review action
            _editReview(
              context,
              widget.review,
              _reviewEditingController.text,
              _rating,
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _editReview(
      BuildContext context, Review review, String newContent, int newRating) {
    ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);
    Review updatedReview =
        review.copyWith(comment: newContent, rating: newRating);
    reviewBloc.add(ReviewUpdateReviewEvent(updatedReview));
    Navigator.pop(context);
  }
}

class _AddReviewDialog extends StatefulWidget {
  @override
  _AddReviewDialogState createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<_AddReviewDialog> {
  late TextEditingController _reviewEditingController;
  late int _rating;

  @override
  void initState() {
    super.initState();
    _reviewEditingController = TextEditingController();
    _rating = 1;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Review'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _reviewEditingController,
            decoration: const InputDecoration(
              hintText: 'Write your review here',
            ),
          ),
          const SizedBox(height: 10),
          Text('Rating: $_rating'),
          Slider(
            value: _rating.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (newRating) {
              setState(() {
                _rating = newRating.toInt();
              });
            },
          ),
        ],
      ),
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
            _addReview(context, _reviewEditingController.text, _rating);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _addReview(BuildContext context, String content, int rating) {
    ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);
    TrainerBloc trainerBloc = BlocProvider.of<TrainerBloc>(context);
    TrainerLoadSuccess trainerState = trainerBloc.state as TrainerLoadSuccess;
    int trainerId = trainerState.trainer.id;
    Review newReview = Review(
      comment: content,
      rating: rating,
      traineeId: 1,
      trainerId: trainerId,
    );
    reviewBloc.add(ReviewCreateEvent(review: newReview));
    Navigator.pop(context);
  }
}

class _DeleteReviewDialog extends StatelessWidget {
  final Review review;

  const _DeleteReviewDialog({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Review'),
      content: const Text('Are you sure you want to delete this review?'),
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
            // Perform delete review action
            _deleteReview(context, review);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }

  void _deleteReview(BuildContext context, Review review) {
    ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);
    reviewBloc.add(ReviewDeleteReviewEvent(reviewId: review.id!));
    Navigator.pop(context);
  }
}
