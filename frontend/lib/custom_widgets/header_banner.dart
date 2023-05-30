import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltJTIwd29ya291dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "Workout Warrior",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 50,
                        fontFamily: 'Verdana',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
