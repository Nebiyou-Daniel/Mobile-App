import 'package:flutter/material.dart';
class TrainerApprovalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Trainers\' approval page',
      home:Scaffold(appBar:AppBar(title:const Text('Trainers\' approval page')),body:TrainerApprovalHome())
    );
  }
}
class TrainerApprovalHome extends StatefulWidget{
  @override
  ApprovalPageState createState()=>ApprovalPageState(); 
}
class ApprovalPageState extends State<TrainerApprovalHome>{
  String? tName;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20), 
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Container(
          child:Column(children:[
        Row(
          children:[
              const Icon(Icons.info),
              const SizedBox(width:10),
              Text('Trainer\'s name:',style:TextStyle(color:Colors.grey[500],fontSize:20)),
              const SizedBox(width:30),
              Text('Some name')
        ]),
        const SizedBox(height:30),
        Row(
          children:[
            const Icon(Icons.email),
            const SizedBox(width:10),
            Text('E-mail:',style:TextStyle(color:Colors.grey[500], fontSize:20)),
            const SizedBox(width:30),
            const Text('Email@ gmail.com')
        ]),
        const SizedBox(height:30),
         Row(
          children:[
              const Icon(Icons.info),
              const SizedBox(width:10),
              Text('Username:',style:TextStyle(color:Colors.grey[500],fontSize:20)),
              const SizedBox(width:30),
              Text('username001')
        ]),
        const SizedBox(height:30),
        Container(
          padding:const EdgeInsets.all(20),
          decoration:BoxDecoration(border: Border.all(color:Colors.blue,width:2,),borderRadius: BorderRadius.all(Radius.circular(10))),
          child:const Text("Information about the trainer is displayed here",style:TextStyle(fontSize:20))
        ),
          ])
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children:[
          TextButton(
          onPressed:(){},
          style:TextButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
          child:const Padding(padding:EdgeInsets.all(8),child:Text('Approve'))),
          const SizedBox(width:20),
          TextButton(
          onPressed:(){},
          style:TextButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white),
          child:const Padding(padding:EdgeInsets.all(8),child:Text('Reject')))
        ])
      ])
      );
  }
}