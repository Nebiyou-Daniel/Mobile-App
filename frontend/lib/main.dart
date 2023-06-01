import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Reviews/bloc/review_bloc.dart';
import 'package:frontend/notifications/views/notification_screen.dart';
import 'package:frontend/Theme/theme.dart';

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
import 'UI/common/about.dart';
import 'UI/common/contacts.dart';
import 'UI/trainee/traineeProgressPage.dart';

import 'UI/trainee/trainee_trainer_detail.dart';
import 'trainee/views/traineeHomePage.dart';
import 'trainee/views/traineeList.dart';
import 'trainee/views/trainee_detail_for_trainer.dart';
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
      //   path: '/trainee/trainer_profile',
      //   builder: (context, state) => TrainerProfile(),
      // ),
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
        BlocProvider<ReviewBloc>(
          create: (context) => ReviewBloc(),
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
