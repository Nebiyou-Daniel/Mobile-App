import 'package:flutter/material.dart';

class TraineesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Trainees List",
        home: Scaffold(
            appBar: AppBar(title: const Text("Trainees Page")),
            body: Padding(
                padding: const EdgeInsets.all(30), child: TraineesListPage())));
  }
}

class TraineesListPage extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

List<String> lst = ['Date', 'Alphabetical', 'One', 'Two'];

class PageState extends State<TraineesListPage> {
  String? current = 'sort by';
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Drop(),
            const SizedBox(width: 100),
            Flexible(child: SearchBar())
          ]),
          const SizedBox(height: 30),
          Column(children: [
            TraineesCard(username: 'username', fullname: 'Robb Stark')
          ])
        ],
      )),
    ]));
  }
}

class TraineesCard extends StatelessWidget {
  final String? username;
  final String? fullname;
  const TraineesCard({super.key, this.username, this.fullname});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        //decoration:BoxDecoration(border:Border.all(color:Colors.purpleAccent,width:3.0),),
        child: Card(
            elevation: 5,
            color: Color.fromARGB(255, 214, 214, 213),
            borderOnForeground: true,
            //shadowColor:Colors.black,
            margin: const EdgeInsets.only(top: 20),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage('assets/pic2.jfif'),
                        radius: 40),
                    const SizedBox(width: 50),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700])),
                          Text('$username',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 30.0),
                          Text('Full Name',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700])),
                          Text('$fullname',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Select'))
                        ])
                  ],
                ))));
  }
}

class SearchBar extends StatefulWidget {
  @override
  SBState createState() => SBState();
}

class SBState extends State<SearchBar> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
            icon: Icon(Icons.search), labelText: "Enter username"),
        controller: _controller,
        onSubmitted: (String val) {});
  }
}

class Drop extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

List<String> lst2 = ['Name', 'Date', 'Joined'];

class MyState extends State<Drop> {
  String? current = lst2.first;
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: current,
        items: lst2
            .map((String val) =>
                DropdownMenuItem<String>(value: val, child: Text(val)))
            .toList(),
        onChanged: (String? v) {
          setState(() {
            current = v;
          });
        });
  }
}
