import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/weight_mode.dart';
import '../weight.dart';

class AddWeightWidget extends StatefulWidget {
  const AddWeightWidget({Key? key}) : super(key: key);

  @override
  _AddWeightWidgetState createState() => _AddWeightWidgetState();
}

class _AddWeightWidgetState extends State<AddWeightWidget> {
  late TextEditingController weightController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add Weight"),
              content: TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: "Weight in Kilograms",
                ),
                keyboardType: TextInputType.number,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    final weightData = double.tryParse(weightController.text);
                    if (weightData != null) {
                      final weightBloc = context.read<WeightBloc>();
                      Weight newWeight = Weight.fromJson({
                        "weight": weightData.toString(),
                      });

                      weightBloc.add(WeightAddEvent(weightData: newWeight));
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
