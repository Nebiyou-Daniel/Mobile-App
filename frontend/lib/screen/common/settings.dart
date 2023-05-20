import 'package:flutter/material.dart';
import '../../Custom_Widgets/header_banner.dart';
import '../../custom_widgets/header_banner_with_icons.dart';
import '../../custom_widgets/settings_form.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: const <Widget>[
            HeaderBannerWithIcons(),
            SettingsWidget(),
          ],
        ),
      ),
    );
  }
}
