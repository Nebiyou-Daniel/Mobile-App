import 'package:flutter/material.dart';
import 'package:frontend/screen/common/splashScreen.dart';
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
      GoRoute(
        path: '/workoutPlanCreationPage',
        builder: (context, state) => const WorkoutPlanCreationPage(),
      ),
      GoRoute(
        path: '/admin/homePage',
        builder: (context, state) => const AdminHomePage(),
      ),
      GoRoute(
        path: '/admin/listOfTrainees',
        builder: (context, state) => const AdminListOfTrainees(),
      ),
      GoRoute(
        path: '/admin/listOfTrainers',
        builder: (context, state) => const AdminListOfTrainers(),
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
        path: '/trainer/homePage',
        builder: (context, state) => const TrainerHomePage(),
      ),
      GoRoute(
        path: '/trainer/profile',
        builder: (context, state) => const TrainerProfile(),
      ),
      GoRoute(
        path: '/trainer/createPlan',
        builder: (context, state) => const TrainerCreatePlan(),
      ),
      GoRoute(
        path: '/trainer/listOfTrainees',
        builder: (context, state) => const TrainerListOfTrainees(),
      ),
      GoRoute(
        path: '/trainer/notifications',
        builder: (context, state) => const TrainerNotifications(),
      ),
      GoRoute(
        path: '/trainee/homePage',
        builder: (context, state) => const TraineeHomePage(),
      ),
      GoRoute(
        path: '/trainee/applyAsTrainer',
        builder: (context, state) => const TraineeApplyAsTrainer(),
      ),
      GoRoute(
        path: '/trainee/profile',
        builder: (context, state) => const TraineeProfile(),
      ),
      GoRoute(
        path: '/trainee/progress',
        builder: (context, state) => const TraineeProgress(),
      ),
      GoRoute(
        path: '/trainee/workoutPlan',
        builder: (context, state) => const TraineeWorkoutPlan(),
      ),
      GoRoute(
        path: '/trainee/chooseTrainer',
        builder: (context, state) => const TraineeChooseTrainer(),
      ),
      GoRoute(
        path: '/trainee/notifications',
        builder: (context, state) => const TraineeNotifications(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}

/**

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
      `/admin/`

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
*/
