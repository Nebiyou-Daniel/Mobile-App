import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Full width
      width: MediaQuery.of(context).size.width,
      // 1/3 of the height of the screen
      height: MediaQuery.of(context).size.height / 3,

      child: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: false, // Replace with your own dark mode state value
              onChanged: (bool value) {
                value = !value;
                // print(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              // Replace with your own logic to toggle notifications
            },
          ),
          ListTile(
            title: const Text('Edit Profile'),
            onTap: () {
              // Replace with your own logic to toggle notifications
            },
          ),
        ],
      ),
    );
  }
}
