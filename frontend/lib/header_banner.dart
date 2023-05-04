import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        const Image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltJTIwd29ya291dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60")),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Text(
              "Workout",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Warrior",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        )
      ]),
    );
  }
}
