import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/auth/bloc/auth_bloc.dart';
import 'package:frontend/screen/common/splashScreen.dart';
import 'package:frontend/screen/common/about.dart';
import 'package:frontend/screen/admin/adminSignupAndLogin.dart';
import 'package:frontend/screen/trainee/trainee_profile.dart';
import 'package:frontend/screen/common/login.dart';
import 'package:frontend/screen/common/settings.dart';
import 'package:frontend/screen/common/signup.dart';
import 'package:frontend/screen/traineeProgressPage.dart';
import 'package:frontend/screen/workoutPlanCreationPage.dart';
import 'package:go_router/go_router.dart';

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
        path: '/traineeProfile',
        builder: (context, state) => const TraineeProfile(),
      ),
      GoRoute(
        path: '/traineeProgressPage',
        builder: (context, state) => const TraineeProgressPage(),
      ),
      // request sent page
      GoRoute(
        path: '/requestSent',
        builder: (context, state) => const RequestSentPage(),
      ),
      GoRoute(
        path: '/workoutPlanCreationPage',
        builder: (context, state) => const WorkoutPlanCreationPage(),
      ),

      // admin routes
      GoRoute(
        path: '/admin/homePage',
        builder: (context, state) => const AdminHomePage(),
      ),
      GoRoute(
        path: '/admin/listOfTrainees',
        builder: (context, state) => const AdminListOfTraineesPage(),
      ),
      GoRoute(
        path: '/admin/listOfTrainers',
        builder: (context, state) => const AdminListOfTrainersPage(),
      ),
      GoRoute(
        path: '/admin/approvalPage',
        builder: (context, state) => const AdminApprovalPage(),
      ),
      GoRoute(
        path: '/admin/notifications',
        builder: (context, state) => const AdminNotifications(),
      ),
      GoRoute(
        path: '/admin/enterCode',
        builder: (context, state) => const AdminEnterCodePage(),
      ),
      // watch trainer profile
      GoRoute(
        path: '/admin/trainer_profile',
        builder: (context, state) => const AdminTrainerProfilePage(),
      ),
      GoRoute(
        path: '/admin/trainee_profile',
        builder: (context, state) => const AdminTraineeProfilePage(),
      ),

      // trainer routes
      GoRoute(
        path: '/trainer/homePage',
        builder: (context, state) => const TrainerHomePage(),
      ),
      GoRoute(
        path: '/trainer/profile',
        builder: (context, state) => const TrainerProfilePage(),
      ),
      GoRoute(
        path: '/trainer/createPlan',
        builder: (context, state) => const TrainerCreatePlan(),
      ),
      GoRoute(
        path: '/trainer/listOfTrainees',
        builder: (context, state) => const TrainerListOfTraineesPage(),
      ),
      GoRoute(
        path: '/trainer/notifications',
        builder: (context, state) => const TrainerNotificationsPage(),
      ),

      // trainee routes
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
        builder: (context, state) => const TraineeProgressPage(),
      ),
      GoRoute(
        path: '/trainee/workoutPlan',
        builder: (context, state) => const TraineeWorkoutPlanPage(),
      ),
      GoRoute(
        path: '/trainee/chooseTrainer',
        builder: (context, state) => const TraineeChooseTrainerPage(),
      ),
      GoRoute(
        path: '/trainee/notifications',
        builder: (context, state) => const TraineeNotificationsPage(),
      ),
      GoRoute(
        path: '/trainee/applyAsTrainer',
        builder: (context, state) => const TraineeApplyAsTrainerPage(),
      ),
      // trainer application submitted page
      GoRoute(
        path: 'trainee/request_sent',
        builder: (context, state) => const TraineeRequestSentPage(),
      ),
      // view trainer's profile
      GoRoute(
        path: '/trainee/trainer_profile',
        builder: (context, state) => const TraineeTrainerProfilePage(),
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
        BlocProvider<>(
          create: (context) => SubjectBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      ),
    );

    // return MaterialApp.router(
    //   routerDelegate: _router.routerDelegate,
    //   routeInformationParser: _router.routeInformationParser,
    // );
  }
}



/*
    A list of possible routes in our application.
      `/`                    => shows splash screen
      `/login`               => shows login page
      `/signup`              => shows sign up page
      `/about`               => shows about page
      `/settings`            => shows settings page
      `/contact`             => shows contact page


      ########__admin_routes__########
      `/admin/homePage`        => the home page of the admin
      `/admin/listOfTrainees`  => list of trainees for the admin to see
      `/admin/listOfTrainees`  => list of trainers for the admin to see
      `/admin/approvalPage`    => page to approve or disapprove requests from users that admin should handle
      `/admin/notifications`   => notifications for the admin
      `/admin/enter_code`  => the page to enter the login code for the admin
      // router for admin to watch trainee profile
      `/admin/trainee_profile` => the profile of trainee

      ########__trainer_routes__########
      `trainer/home_page`      => trainer home page
      `trainer/profile`        => the profile of trainer
      `trainer/create_plan`    => the page to create workout plan for trainee
      `trainer/list_of_trainees` => the list of trainees for the trainer
      `trainer/notifications`  => notifications for the trainer

      

      #######__trainee_routes__########
      `trainee/home_page`          => the trainee home page
      `trainee/apply_as_trainer`   => for trainer to apply as a trainer
      `trainee/profile`            => the profile of trainee
      `trainee/progress`           => the progress of trainee
      `trainee/workout_plan`       => the workout plan of trainee
      `trainee/choose_trainer`     => the page to choose trainer
      `trainee/notifications`      => notifications for the trainee
      `trainee/request_sent`       => the page to show that the request has been sent

*/