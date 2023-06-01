import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:go_router/go_router.dart';

import '../../custom_widgets/bottom_navigation_trainee.dart';
import '../../custom_widgets/bottom_navigation_trainer.dart';
import '../../custom_widgets/header_banner_with_icons.dart';



class TrainerProfile extends StatefulWidget {
  const TrainerProfile({super.key});

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  String trainerName = "Abebe";
  String trainerEmail = "abebe@gmail.com";
  String trainerBio = "this is trainer bio";
  String trainerPhoneNo = "+25194567823";
  String image = "https://picsum.photos/200";

  final reviews =[{'name': 'abebe', 'review':'this is the review part', 'rate': '3'},
  {'name': 'chane', 'review':'this is the review part', 'rate': '2'},
  {'name': 'brad', 'review':'this is the review part', 'rate': '5'},
  {'name': 'john', 'review':'this is the review part', 'rate': '4'},];


  void updatePicture(){
    print('update picture clicked.');
  }

  void updateProfile(){
    print('update profile clicked.');
  }

  void listOfTrainees(){
    print('list of trainees clicked.');
  }

  void logOut(BuildContext context){
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text(
          'Are you sure you want log out?',),
        actions: <Widget>[
          ElevatedButton(
          child: const Text('Yes'),
          onPressed: () {
            print('logged out');
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

  void terminateAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terminate Account'),
          content: const Text(
            'Are you sure you want terminate this account? Once terminated the account no longer exit.',
            ),
          actions: <Widget>[
            ElevatedButton(
            child: const Text('Yes'),
            onPressed: () {
              print('account terminated.');
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
    return Builder(
      builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                const Text('Profile page'),
                const Spacer(),
                TextButton(
                  onPressed: (){
                    print('notification pressed');
                  },
                  child: const Icon(Icons.notifications_none_outlined,
                  color: Colors.white,
                  ),
                )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0),
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(onPressed: () => updatePicture() , 
                        child: const Text('Update Picture')),
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
                            Text('User Name: $trainerName',
                            style:textStyle,),
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
                            Text('Email: $trainerEmail',
                            style: textStyle,),
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
                            Text('Bio: $trainerBio',
                            style: textStyle,),
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
                            Text('Phone No: $trainerPhoneNo',
                            style: textStyle,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => updateProfile(),
                           child: const Text('Update Profile')),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => listOfTrainees(), 
                          child: const Text('List of your Trainees')),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(30)),
                    const Padding(padding: EdgeInsets.only(top:20),
                    child: Text("Reviews"),),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                      height: 400,
                      width: 400,
                      child: ListView.builder(
                        itemCount: reviews.length,
                        itemBuilder:(BuildContext context, index){
                          return Container(
                            child: TextButton(
                              onPressed: () => {},
                              child: Column(children: [
                                SizedBox(
                                  width: 300,
                                  child: Padding(padding: const EdgeInsets.all(8),
                                  child: Text("${reviews[index]["name"]}"),),
                                ),
                                SizedBox(
                                      width: 300,
                                      child: 
                                          RatingBarIndicator(
                                            rating: double.parse('${reviews[index]['rate']}'),
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
                                  child: Padding(padding: const EdgeInsets.all(8),
                                  child: Text("${reviews[index]["review"]}"),),
                                ),
                              ]),
                            ),
                          );
                        })
                        ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    SizedBox(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => logOut(context),
                          child: const Text('Log Out')),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () => terminateAccount(context), 
                          child: const Text('Terminate Account')),
                      ),
                    ),
                    
                ]),
              ),
            ),
            bottomNavigationBar: TrainerBottomNavigation(selectedIndex: 1,)
           );
           });
  }

}