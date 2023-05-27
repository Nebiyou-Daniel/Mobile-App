import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TrainerChoosingPage extends StatefulWidget {
  const TrainerChoosingPage({super.key});

  @override
  State<TrainerChoosingPage> createState() => _TrainerChoosingPageState();
}

class _TrainerChoosingPageState extends State<TrainerChoosingPage> {
  final trainers = [{"name": "abebe", "speciality": "blabla", "rating": "4", "numberOfTrainees": "12"},
    {"name": "abebe", "speciality": "blabla", "rating": "3", "numberOfTrainees": "14" },
    {"name": "chala", "speciality": "blabla", "rating": "5", "numberOfTrainees": "9" },
    {"name": "Gemechu", "speciality": "blabla", "rating": "1", "numberOfTrainees": "10" },
  ];
  final sortType = ['Rating','No of Trainees'];
  String? sortBy ;

  void sort(value){
    setState(() {
      sortBy = value;
    });
  }

  // void selectTrainer(BuildContext context, Map<String, String> trainer){
  //     showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Trainer Selected'),
  //         content: Container(
  //           height: 150,
  //           padding: const EdgeInsets.all(10),
  //           child: Column(
  //             children: [
  //               const Text('You have selected this trainer:'), 
  //               SizedBox(
  //                 width: 400 ,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Text('Name: ${trainer['name']}'),
  //                 )),
  //               SizedBox(
  //                 width: 400,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Text('Speciality: ${trainer['speciality']}'),
  //                 )),
  //               SizedBox(
  //                 width: 400,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Text('Rating: ${trainer['rating']}'),
  //                 )),
  //               SizedBox(
  //                 width: 400,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Text('Number of Trainees: ${trainer['numberOfTrainees']}'),
  //                 )),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //           child: const Text('Confirm'),
  //           onPressed: () {
  //             print('Trainer Selected');
  //             Navigator.of(context).pop();
  //             },
  //           ),
  //           ElevatedButton(
  //           child: const Text('Close'),
  //           onPressed: () => Navigator.of(context).pop(),
  //           )
  //         ],
  //       );
  //     },
  //     );  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title:const Text('Choose your trainer')
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: DropdownButton(
                  hint: const Text("Sort by"),
                  items: sortType.map((String value) {
                    return DropdownMenuItem<String>(value: value, child:
                    Text(value),);
                  }).toList(),
                  onChanged: (value) => sort(value),
                  value: sortBy,
                  ),
              ),
              Builder(
                builder: (context) {
                  return Container(
                    height: 0.8 * MediaQuery.of(context).size.height,
                    child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: trainers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:const EdgeInsets.all(8),
                        height: 80,
                        child: TextButton(
                          onPressed: () => print('trainer selected'),
                          child: Column(
                            children: [
                              SizedBox(
                              width: 400 ,
                              child: Text('Name: ${trainers[index]['name']}')),
                              SizedBox(
                                width: 400,
                                child: Text('Speciality: ${trainers[index]['speciality']}')),
                              SizedBox(
                                width: 400,
                                child: Text('Number of Trainees: ${trainers[index]['numberOfTrainees']}')),  
                              SizedBox(
                                width: 400,
                                child: 
                                    RatingBarIndicator(
                                      rating: double.parse('${trainers[index]['rating']}'),
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
                        );
                    }
                            ),
                  );
                }
              ),
          ]
          ),
        )
      )
    );
  }
}