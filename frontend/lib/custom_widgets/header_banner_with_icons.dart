import 'package:flutter/material.dart';
import 'header_banner.dart';

class HeaderBannerWithIcons extends StatelessWidget {
  const HeaderBannerWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const HeaderBanner(),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // A button with an account_circle icon that takes the user to their profile when pressed
                  FloatingActionButton(
                    onPressed: () {
                      print("profile pressed");
                    },
                    backgroundColor: Colors.white,
                    elevation: 4,
                    mini: true,
                    child: const Icon(
                      Icons.account_circle_outlined,
                      size: 28,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // A button with a notification icon that takes the user to their notifications when pressed
                  FloatingActionButton(
                    onPressed: () {
                      print("notification pressed");
                    },
                    backgroundColor: Colors.white,
                    elevation: 4,
                    mini: true,
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.blue,
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
