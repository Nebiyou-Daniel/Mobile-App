import 'package:flutter/material.dart';
import 'header_banner.dart';

class HeaderBannerWithIcons extends StatelessWidget {
  const HeaderBannerWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const HeaderBanner(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // A button with a notification icon that takes the user to their notifications when pressed
                        TextButton(
                          onPressed: () {
                            print("notification pressed");
                          },
                          // backgroundColor: Colors.white,
                          // elevation: 4,
                          // mini: true,
                          child: const Icon(
                            Icons.notifications_none_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
