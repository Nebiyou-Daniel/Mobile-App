import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/notifications/views/notification_screen.dart';
import 'package:frontend/theme/bloc/theme_bloc.dart';

import 'package:frontend/auth/bloc/auth_bloc.dart';
import 'package:frontend/UI/common/splashScreen.dart';
import 'package:frontend/trainee/views/trainee_profile.dart';
import 'package:frontend/UI/common/login.dart';
import 'package:frontend/UI/common/settings.dart';
import 'package:frontend/UI/common/signup.dart';
import 'package:frontend/trainer/trainer.dart';
import 'package:frontend/trainer/views/trainerDetailPageForTrainee.dart';
import 'package:frontend/trainer/views/trainerList.dart';
import 'package:frontend/trainer/views/trainerProfile.dart';
import 'package:frontend/trainerHiring/bloc/trainer_hiring_bloc.dart';
import 'package:frontend/weight/bloc/weight_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/trainee/trainee.dart';
import 'UI/admin/admin_home.dart';
import 'UI/common/about.dart';
import 'UI/common/contacts.dart';
import 'UI/trainee/traineeProgressPage.dart';

import 'trainee/views/traineeHomePage.dart';
import 'trainee/views/traineeList.dart';
import 'trainee/views/trainee_detail_for_trainer.dart';
import 'trainee/views/trainerChoosingPage.dart';
import 'trainer/views/trainerDetailPageForAdmin.dart';
import 'trainer/views/trainerHomePage.dart';
import 'UI/trainer/workoutPlanCreationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      // common routes
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const Settings(),
      ),
      GoRoute(
        path: '/traineeProgressPage',
        builder: (context, state) => TraineeProgressPage(),
      ),
      GoRoute(
        path: '/workoutPlanCreationPage',
        builder: (context, state) => const WorkoutPlanCreationPage(),
      ),
      // go router for about page
      GoRoute(
        path: '/aboutus',
        builder: (context, state) => const AboutPage(),
      ),
      // go router for contact us page
      GoRoute(
        path: '/contactUs',
        builder: (context, state) => const ContactsUsPage(),
      ),

      // admin routes
      GoRoute(
        path: '/admin/homePage',
        builder: (context, state) => const AdminHomePage(),
      ),
      GoRoute(
        path: '/admin/trainees',
        builder: (context, state) => const ListOfTrainees(),
      ),
      GoRoute(
        path: '/admin/trainers',
        builder: (context, state) => const ListOfTrainers(),
      ),
      GoRoute(
        path: '/admin/traineedetail/:id',
        pageBuilder: (context, state) {
          final id = state.params['id'];
          return MaterialPage<void>(
            child: TraineeDetailForAdmin(id: id!),
          );
        },
      ),

      // trainer routes
      GoRoute(
        path: '/trainer/homePage',
        builder: (context, state) => const TrainerHomePage(),
      ),
      GoRoute(
        path: '/trainer/traineeProfile/:id',
        pageBuilder: (context, state) {
          final int id = int.parse(state.params['id']!);
          return MaterialPage<void>(
            child: TraineeDetailForTrainer(id: id.toString()),
          );
        },
      ),

      GoRoute(
        path: '/trainer/profile',
        builder: (context, state) => const TrainerProfile(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationScreen(),
      ),

      // // trainee routes
      GoRoute(
        path: '/trainee/homePage',
        builder: (context, state) => const TraineeHomePage(),
      ),
      GoRoute(
        path: '/trainee/profile',
        builder: (context, state) => const TraineeProfile(),
      ),
      GoRoute(
        path: '/trainee/progress',
        builder: (context, state) => TraineeProgressPage(),
      ),
      // GoRoute(
      //   path: '/trainee/workoutPlan',
      //   builder: (context, state) => const TraineeWorkoutPlanPage(),
      // ),
      GoRoute(
        path: '/trainee/chooseTrainer',
        builder: (context, state) => const TrainerChoosingPage(),
      ),
      GoRoute(
        path: '/trainee/trainer_profile/:id',
        pageBuilder: (context, state) {
          final int id = int.parse(state.params['id']!);
          return MaterialPage<void>(
            child: TrainerDetailForTrainee(id: id),
          );
        },
      ),
      GoRoute(
        path: '/admin/trainer_profile/:id',
        pageBuilder: (context, state) {
          final int id = int.parse(state.params['id']!);
          return MaterialPage<void>(
            child: TrainerDetailForAdmin(id: id.toString()),
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // using bloc multiProvider to provide the router to all the widgets in the app
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<TraineeBloc>(
          create: (context) => TraineeBloc(),
        ),
        BlocProvider<TrainerBloc>(
          create: (context) => TrainerBloc(),
        ),
        BlocProvider<WeightBloc>(
          create: (context) => WeightBloc(),
        ),
        BlocProvider<TrainerHiringBloc>(
          create: (context) => TrainerHiringBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      ),
    );
  }
}
