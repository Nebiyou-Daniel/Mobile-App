import 'package:flutter/material.dart';
import 'header_banner.dart';

class HeaderBannerWithIcons extends StatelessWidget {
  const HeaderBannerWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            const HeaderBanner(),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 2, 18, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // A button eith a account_circle as a child that takes to the user's profile onpressed
                  FloatingActionButton(
                    onPressed: () {
                      print("profile pressed");
                    },
                    child: const Icon(
                      Icons.account_circle_outlined,
                      size: 35,
                    ),
                  ),
                  // a notification icon that takes to the user's notifications on press
                  FloatingActionButton(
                    onPressed: () {
                      print("notification pressed");
                    },
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      grade: 2.0,
                      size: 35,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
