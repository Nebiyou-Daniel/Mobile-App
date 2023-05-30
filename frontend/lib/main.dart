import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/notifications/views/notification_screen.dart';
import 'package:frontend/Theme/theme.dart';

import 'package:frontend/auth/bloc/auth_bloc.dart';
import 'package:frontend/UI/common/splashScreen.dart';
import 'package:frontend/UI/trainee/trainee_profile.dart';
import 'package:frontend/UI/common/login.dart';
import 'package:frontend/UI/common/settings.dart';
import 'package:frontend/UI/common/signup.dart';
import 'package:frontend/trainer/trainer.dart';
import 'package:frontend/trainer/views/trainerDetailPageForTrainee.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/trainee/trainee.dart';

import 'UI/common/about.dart';
import 'UI/common/contacts.dart';
import 'UI/trainee/traineeProgressPage.dart';

import 'UI/trainee/trainee_trainer_detail.dart';
import 'trainee/views/traineeHomePage.dart';
import 'trainee/views/trainerChoosingPage.dart';

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
        builder: (context, state) => const TraineeTrainerDetail(),
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
        path: '/traineedetail/:id',
        pageBuilder: (context, state) {
          final id = state.params['id'];
          return MaterialPage<void>(
            child: TraineeDetail(id: id!),
          );
        },
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
      // GoRoute(
      //   path: '/admin/homePage',
      //   builder: (context, state) => const AdminHomePage(),
      // ),
      // GoRoute(
      //   path: '/admin/listOfTrainees',
      //   builder: (context, state) => const AdminListOfTraineesPage(),
      // ),
      // GoRoute(
      //   path: '/admin/listOfTrainers',
      //   builder: (context, state) => const AdminListOfTrainersPage(),
      // ),
      // GoRoute(
      //   path: '/admin/approvalPage',
      //   builder: (context, state) => const AdminApprovalPage(),
      // ),
      // GoRoute(
      //   path: '/admin/notifications',
      //   builder: (context, state) => const AdminNotifications(),
      // ),
      // GoRoute(
      //   path: '/admin/enterCode',
      //   builder: (context, state) => const AdminEnterCodePage(),
      // ),
      // // watch trainer profile
      // GoRoute(
      //   path: '/admin/trainer_profile',
      //   builder: (context, state) => const AdminTrainerProfilePage(),
      // ),
      // GoRoute(
      //   path: '/admin/trainee_profile',
      //   builder: (context, state) => const AdminTraineeProfilePage(),
      // ),

      // trainer routes
      GoRoute(
        path: '/trainer/homePage',
        builder: (context, state) => const TrainerHomePage(),
      ),
      // GoRoute(
      //   path: '/trainer/profile',
      //   builder: (context, state) => const TrainerProfilePage(),
      // ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationScreen(),
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
        builder: (context, state) => TrainerChoosingPage(),
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

      // GoRoute(
      //   path: '/trainee/applyAsTrainer',
      //   builder: (context, state) => const TraineeApplyAsTrainerPage(),
      // ),
      // // trainer application submitted page
      // GoRoute(
      //   path: 'trainee/request_sent',
      //   builder: (context, state) => const TraineeRequestSentPage(),
      // ),
      // // view trainer's profile
      GoRoute(
        path: '/trainee/trainer_profile',
        builder: (context, state) => const TrainerProfile(),
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      ),
    );
  }
}
