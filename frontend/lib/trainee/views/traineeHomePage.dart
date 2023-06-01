import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/auth/auth.dart';
import 'package:frontend/trainee/trainee.dart';
import 'package:frontend/Theme/theme.dart';

import '../../Custom_Widgets/header_banner.dart';
import '../../Task/views/traineeTask.dart';
import '../../custom_widgets/bottom_navigation_trainee.dart';
import '../../weight/views/weight_chart.dart';
import '../../weight/weight.dart';

class TraineeHomePage extends StatelessWidget {
  const TraineeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<TraineeBloc>(create: (context) => TraineeBloc()),
        BlocProvider<WeightBloc>(create: (context) => WeightBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Workout Warrior",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Workout Warrior"),
            backgroundColor: const Color(0xFF0A568A),
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
                  child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    if (state is AuthLoginSuccess ||
                        state is AuthSignupSuccess ||
                        state is AuthInitial) {
                      return TextButton(
                        onPressed: () {
                          authBloc.add(AuthLogoutEvent());
                        },
                        child: const Text("Logout"),
                      );
                    } else if (state is AuthLogoutSuccess) {
                      // Navigate to the login screen when the user has logged out
                      // Delay the navigation to the login screen
                      Future.delayed(Duration.zero, () {
                        GoRouter.of(context).go('/login');
                      });
                      return const Text("Logout");
                    } else {
                      return const Text("Unexpected error occurred!");
                    }
                  }),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const HeaderBanner(),

                // some text showing that the next chart is a weight chart
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Weight Chart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 180, child: WeightChartHandler(id: -1)),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: const TaskDatePickerHandeler(),
                )
              ],
            ),
          ),
          bottomNavigationBar: TraineeBottomNavigation(selectedIndex: 0),
        ),
      ),
    );
  }
}

class TaskDatePickerHandeler extends StatelessWidget {
  const TaskDatePickerHandeler({super.key});

  @override
  Widget build(BuildContext context) {
    return const TraineeTask();
  }
}
