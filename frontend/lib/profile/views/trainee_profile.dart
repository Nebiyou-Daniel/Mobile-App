import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/custom_widgets/header_banner.dart';
import 'package:frontend/custom_widgets/logoutButton.dart';
import 'package:frontend/trainer/views/trainer_hired_by_trainee.dart';
import 'package:go_router/go_router.dart';

import '../../Theme/theme.dart';
import '../../auth/auth.dart';
import '../../custom_widgets/bottom_navigation_trainee.dart';
import '../../custom_widgets/deleteSelfAccountButton.dart';
import '../../custom_widgets/profile_form.dart';

class TraineeProfile extends StatelessWidget {
  const TraineeProfile({super.key});

  final String name = "John Doe";
  final String bio = "A passionate developer and a lifelong learner.";
  final String image = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeBloc>().state.theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Workout Warrior"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                GoRouter.of(context).push('/notifications');
              },
            ),
          ],
          leading: PopupMenuButton(
            child: const Icon(Icons.person_2_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                  },
                  child: const Text("Logout"),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderBanner(),
              // a widget that shows this user is a trainee
              Row(
                children: const [
                  Icon(Icons.person),
                  Text("Role: Trainee"),
                ],
              ),
              ProfileForm(),
              const Divider(),
              const LogoutButton(),
              const Divider(),
              const DeleteSelfAccountButton(),
              Container(height: 20),
              const TrainerHiredByTrainee(),
              Container(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: TraineeBottomNavigation(selectedIndex: 1),
      ),
    );
  }
}
