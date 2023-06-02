import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../custom_widgets/header_banner_with_icons.dart';

class TraineeTrainerDetail extends StatefulWidget {
  const TraineeTrainerDetail({super.key});

  @override
  State<TraineeTrainerDetail> createState() => _TraineeTrainerDetailState();
}

class _TraineeTrainerDetailState extends State<TraineeTrainerDetail> {
  String trainerName = "Abebe";
  String trainerEmail = "abebe@gmail.com";
  String trainerBio = "this is trainer bio";
  String trainerPhoneNo = "+25194567823";
  String image = "https://picsum.photos/200";
  final _editFormKey = GlobalKey<FormState>();
  final _addFormKey = GlobalKey<FormState>();

  final reviews = [
    {'name': 'abebe', 'review': 'this is the review part', 'rate': '3'},
    {'name': 'chane', 'review': 'this is the review part', 'rate': '2'},
    {'name': 'brad', 'review': 'this is the review part', 'rate': '5'},
    {'name': 'john', 'review': 'this is the review part', 'rate': '4'},
  ];

  void listOfTrainees() {
    print('list of trainees clicked.');
  }

  void editReview(BuildContext context, index, Map<String, String> review) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String rate = '0';
        String editedReview = '';
        return Form(
          key: _editFormKey,
          child: AlertDialog(
            title: const Text('Edit Review'),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your review.';
                        }
                        return null;
                      },
                      initialValue: review['review'],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Write your review here.",
                      ),
                      onChanged: (text) {
                        editedReview = text;
                      },
                      maxLines: 7,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Rate Trainer'),
                  ),
                  RatingBar.builder(
                    initialRating: double.parse(review['rate']!),
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      rate = rating.toString();
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Delete'),
                onPressed: () {
                  setState(() {
                    reviews.removeAt(index);
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Review Deleted.')));
                },
              ),
              ElevatedButton(
                child: const Text('Edit'),
                onPressed: () {
                  if (_editFormKey.currentState!.validate()) {
                    setState(() {
                      reviews.replaceRange(index, index + 1, [
                        {
                          'name': (review['name'])!,
                          'review': editedReview,
                          'rate': rate
                        }
                      ]);
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Review Edited.')));
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      },
    );
  }

  void addReview(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String rate = '0';
        String review = '';
        return Form(
          key: _addFormKey,
          child: AlertDialog(
            title: const Text('Write your review.'),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Write your review here.",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your review.';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        review = text;
                      },
                      maxLines: 7,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Rate Trainer'),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      rate = rating.toString();
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if (_addFormKey.currentState!.validate()) {
                    setState(() {
                      reviews.insert(
                          0, {'name': 'chane', 'review': review, 'rate': rate});
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Review Added.')));
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      },
    );
  }

  void selectTrainer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Trainer'),
          content: const Text(
            'Do you want to select this trainer?',
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                print('trainer selected');
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 15);
    double widthOfText = 300;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Profile page'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  print('notification pressed');
                },
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
              ),
              SizedBox(
                width: widthOfText,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      const Padding(padding: EdgeInsets.all(15)),
                      Text(
                        'User Name: $trainerName',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widthOfText,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.email),
                      const Padding(padding: EdgeInsets.all(15)),
                      Text(
                        'Email: $trainerEmail',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widthOfText,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info),
                      const Padding(padding: EdgeInsets.all(15)),
                      Text(
                        'Bio: $trainerBio',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widthOfText,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.phone),
                      const Padding(padding: EdgeInsets.all(15)),
                      Text(
                        'Phone No: $trainerPhoneNo',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => listOfTrainees(),
                      child: const Text('List of Trainees')),
                ),
              ),
              const Padding(padding: EdgeInsets.all(30)),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Reviews"),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  height: 400,
                  width: 400,
                  child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, index) {
                        return TextButton(
                          onPressed: () =>
                              editReview(context, index, reviews[index]),
                          child: Column(children: [
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text("${reviews[index]["name"]}"),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: RatingBarIndicator(
                                rating:
                                    double.parse('${reviews[index]['rate']}'),
                                itemSize: 15,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                direction: Axis.horizontal,
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text("${reviews[index]["review"]}"),
                              ),
                            ),
                          ]),
                        );
                      })),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => addReview(context),
                      child: const Text('Add Review')),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 15, left: 8, right: 8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      onPressed: () => selectTrainer(context),
                      child: const Text('Select Trainer')),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
