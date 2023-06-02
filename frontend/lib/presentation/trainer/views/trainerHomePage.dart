import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common/loading_paragraph.dart';
import 'package:frontend/presentation/custom_widgets/bottom_navigation_trainer.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/application/auth/auth.dart';
import 'package:frontend/application/trainee/trainee.dart';
import 'package:frontend/application/Theme/theme.dart';

import '../../custom_widgets/header_banner.dart';

class TrainerHomePage extends StatelessWidget {
  const TrainerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<TraineeBloc>(create: (context) => TraineeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Workout Warrior",
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
              children: const <Widget>[
                HeaderBanner(),
                // list of trainees indicaiting text
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "List of Trainees",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _ListOfTrainees(),
              ],
            ),
          ),
          bottomNavigationBar: TrainerBottomNavigation(selectedIndex: 0),
        ),
      ),
    );
  }
}

class _ListOfTrainees extends StatelessWidget {
  const _ListOfTrainees();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeBloc, TraineeState>(
      builder: (context, state) {
        final traineeBloc = BlocProvider.of<TraineeBloc>(context);
        print(traineeBloc.state);

        if (state is TraineeInitial) {
          traineeBloc.add(TraineesListLoadEvent());
          return Text("init");
        }
        // if the state is loading, show a progress indicator
        if (state is TraineeLoading) {
          return const Center(
            child: LoadingParagraphWidget(
              numberOfLines: 13,
              message: "Loading your list of trainees... ",
            ),
          );
        }
        // if the trainees are loaded successfully
        else if (state is TraineeListLoadSuccess) {
          // add an event to the bloc to load the trainees
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.trainees.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.trainees[index].fullName),
                subtitle: Text(state.trainees[index].email),
                onTap: () {
                  GoRouter.of(context).push(
                      '/trainer/traineeProfile/${state.trainees[index].id.toString()}');
                },
              );
            },
          );
        }
        // The loading failed
        else if (state is TraineeOperationFailure) {
          print("Trainees operation");
          return const Center(
            child: Text('👀 Failed to load trainees'),
          );
        }
        
        else if (state is TraineeListEmpty) {
          print("Trainees list empty");
          return Center(
            // no trainees
            child: Column(
              children: const [
                Text(
                  "🏜 ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Oh, you poor thing... You have no Trainees',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          );
        } else {
          print("Trainees ");
          traineeBloc.add(TraineesListLoadEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
