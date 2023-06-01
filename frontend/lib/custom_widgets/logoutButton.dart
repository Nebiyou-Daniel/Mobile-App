import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  // listens to auth bloc. when clicked adds AouthLogoutEvent to the bloc, is this gets successfull then is woll redirect to the login page
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccess) {
          GoRouter.of(context).go('/login');
        }
      },
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
        },
        child: const Text("Logout", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
