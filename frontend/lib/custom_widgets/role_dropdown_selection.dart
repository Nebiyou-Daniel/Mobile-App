import 'package:flutter/material.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RoleSelectionState();
  }
}

class _RoleSelectionState extends State<RoleSelection> {
  // hold a state of the currently selected role
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.admin_panel_settings),
        Container(width: 15),
        SizedBox(
          child: DropdownButton<String>(
            // make the dropdown button fill the available space
            hint: const Text("Select Role"),
            value: selectedRole,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 2,
            ),
            onChanged: (String? newValue) {
              setState(
                () {
                  selectedRole = newValue;
                },
              );
            },
            items: <String>['Trainer', 'Trainee', 'Admin']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
