import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth.dart';

class DeleteSelfAccountButton extends StatelessWidget {
  const DeleteSelfAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthDeleteAccountSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);
        }
      },
      child: ElevatedButton(
        onPressed: () {
          print("Trying to delete account");
          BlocProvider.of<AuthBloc>(context).add(AuthDeleteSelfAccountEvent());
        },
        child: const Text("Delete Account",
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
