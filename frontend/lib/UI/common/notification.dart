import 'package:flutter/material.dart';
import './drop.dart';
class NotificationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Notification page',
      home:NotificationHome()
    );
  }
}
class NotificationHome extends StatefulWidget{
  @override
  NotificationState createState()=>NotificationState();
}
class NotificationState extends State<NotificationHome>{
  List<String>notifications=['hello','world','this','is','pc'];
  @override
  Widget build(BuildContext context){
    ButtonStyle sty=TextButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Container(
          padding:const EdgeInsets.all(10),
          decoration:const BoxDecoration(color:Colors.amber),
          child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            TextButton(onPressed:(){},style:sty,child:const Text('Read')),
            TextButton(onPressed:(){},style:sty,child:const Text('Unread'),),
            TextButton(onPressed:(){},style:sty,child:const Text('All')),       
        ]),
        ),
        
        const SizedBox(height:30),
        Expanded(child:ListView.separated(itemBuilder:(BuildContext context,int i ){
          return NotificationCard(info:notifications[i],date:'date',time:"time");
        },
         separatorBuilder:(BuildContext context,int i){return const SizedBox(height:30);}, 
         itemCount: notifications.length
         )
    )]
    );
  }
}
class NotificationCard extends StatelessWidget{
  late String info;
  late String date;
  late String? time;
  NotificationCard({super.key,required this.info,this.time,required this.date});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:(){},
      child:Card(
        color:Colors.blue[200],
        child:Column(
          children:[
              Padding(
                padding:const EdgeInsets.all(10),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:[
                    Text('Date:$date'),
                    const SizedBox(width:20),
                    Text('Time:$time')
                  ])
                ),
              Row(
                  children:[
                    Expanded(child:Container(
                  decoration:const BoxDecoration(color:Colors.white),
                  padding:const EdgeInsets.fromLTRB(10,30,5,10),
                  child:Text(info)
              ))]),
              const Padding(
                padding:EdgeInsets.all(5),
                child:Row(
                  children:[
                    Icon(Icons.info),
                    SizedBox(width:10),
                    Text('Some info')
                ])
              ),
          ]
        )
      )
    );
  }
}
