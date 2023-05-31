
import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // a cupertino rotating loading widget
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),

    );
  }
}

// q: Give me a list of loading widgets in flutter, no url links.
// a:
// 1. CircularProgressIndicator
// 2. LinearProgressIndicator
// 3. RefreshProgressIndicator
// 4. CupertinoActivityIndicator
// 5. FadingCube
// 6. FlareActor
// 7. LiquidCircularProgressIndicator
// 8. LoadingBouncingGrid.circle

