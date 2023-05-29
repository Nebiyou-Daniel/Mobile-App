import 'package:flutter/material.dart';
void main(){runApp(Container());}
class ContactsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"Contacts",
      home:Scaffold(appBar:AppBar(title:const Text("Contacts Page upper")),
          body:const Padding(padding:EdgeInsets.all(30),child:ContactsHome())),
    );
  }
}
class ContactsHome extends StatefulWidget{
  const ContactsHome():super(key:const Key('hallo'));
  @override
  ContactState createState()=>ContactState();
}
class ContactState extends State<ContactsHome>{
  @override
  Widget build(BuildContext context){
    return Container(
      child:Column(children: [
        Row(children:[
          Icon(Icons.info,color:Colors.blue[600],size: 50,),
          const SizedBox(width:20),
          Text("Some info", style:TextStyle(color:Colors.grey[700],fontSize:30,fontFamily: 'Verdana'))
        ]),
        const SizedBox(height:60),
        Row(children:[
          Icon(Icons.star,color:Colors.blue[600]),
          const SizedBox(width:20),
          Text('myemail@gmail.com',style:TextStyle(color:Colors.grey[700],fontSize:20,fontFamily:'Verdana'))
        ]),
        const SizedBox(height:60),
        Row(children:[
          Text("Address:",style:TextStyle(color:Colors.grey[700],fontWeight: FontWeight.w600)),
          const SizedBox(width:20),
          Container(
            padding:const EdgeInsets.all(10),
            decoration:BoxDecoration(
              border:Border.all(width:5,color:const Color.fromARGB(255, 155, 210, 255))
            ),
            child:const Text("Some Contact text")
          )
        ])
      ],)
     );
  }
}
