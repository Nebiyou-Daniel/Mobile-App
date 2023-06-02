import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/custom_widgets/header_banner.dart';
import 'package:go_router/go_router.dart';

import '../../application/auth/auth.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Workout Warrior admin"),
          backgroundColor: const Color(0xFF0A568A),
          leading: Expanded(
            child: PopupMenuButton(
              child: const Icon(Icons.person_2_outlined),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      authBloc.add(AuthLogoutEvent());
                    },
                    child: const Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Builder(builder: (context) {
        print(authBloc.state);
          if (authBloc.state is AuthLogoutSuccess) {
            context.go("/login");
            return Container();
          }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 0.35 * MediaQuery.of(context).size.height,
                    child: const HeaderBanner()),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        // list of all trainees
                        onPressed: () => context.push('/admin/trainees'),
                        child: const Text('List of All Trainees')),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => context.push('/admin/trainers'),
                        child: const Text('List of All Trainers')),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
