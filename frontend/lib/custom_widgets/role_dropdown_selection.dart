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
  String? SelectedRole;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: SelectedRole,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          SelectedRole = newValue;
        });
      },
      items: <String>['Student', 'Teacher', 'Parent', 'Admin']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
    // return const Padding(padding: EdgeInsets.all(234.4));
  }
}
