import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/application/Reviews/bloc/review_bloc.dart';
import 'package:frontend/presentation/notification/notificationScreen.dart';
import 'package:frontend/serviceLocator.dart';
import 'package:frontend/application/Theme/bloc/theme_bloc.dart';

import 'package:frontend/application/auth/bloc/auth_bloc.dart';
import 'package:frontend/presentation/common_screens/splashScreen.dart';
import 'package:frontend/presentation/profile/views/trainee_profile.dart';
import 'package:frontend/presentation/common_screens/login.dart';
import 'package:frontend/presentation/common_screens/settings.dart';
import 'package:frontend/presentation/common_screens/signup.dart';
import 'package:frontend/application/trainer/trainer.dart';
import 'package:frontend/presentation/trainer/trainerDetailPageForTrainee.dart';
import 'package:frontend/presentation/profile/views/trainerProfile.dart';
import 'package:frontend/application/trainerHiring/bloc/trainer_hiring_bloc.dart';
import 'package:frontend/application/weight/bloc/weight_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/application/trainee/trainee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/admin/admin_home.dart';
import 'presentation/common_screens/about.dart';
import 'presentation/common_screens/contacts.dart';
import 'presentation/trainee/views/traineeProgressPage.dart';

import 'application/profile/profile.dart';
import 'presentation/trainee/views/traineeHomePage.dart';
import 'presentation/trainee/views/trainee_detail_for_trainer.dart';
import 'presentation/trainee/views/trainerChoosingPage.dart';
import 'presentation/trainer/trainerHomePage.dart';

import 'presentation/trainer/workoutPlanCreationPage.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  ServiceLocator().registerPreferences(preferences);
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
      // GoRoute(
      //   path: '/admin/listOfTrainees',
      //   builder: (context, state) => const AdminListOfTraineesPage(),
      // ),
      // GoRoute(
      //   path: '/admin/listOfTrainers',
      //   builder: (context, state) => const AdminListOfTrainersPage(),
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
        path: '/trainer/profile',
        builder: (context, state) => TrainerProfile(),
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
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
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
