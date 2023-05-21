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
    return DropdownButton<String>(
      hint: const Text("Select Role"),
      value: selectedRole,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(
          () {
            selectedRole = newValue;
          },
        );
      },
      items: <String>['Trainer', 'Trainee', 'Admin']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
