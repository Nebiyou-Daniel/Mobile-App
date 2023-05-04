import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: double.infinity,
        ),
        const Image(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltJTIwd29ya291dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Text(
                "Workout Warrior",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 65),
              ),
            ],
          ),
        )
      ],
    );
  }
}
