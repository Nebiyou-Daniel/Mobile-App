import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../custom_widgets/header_banner.dart';

import 'package:frontend/application/auth/auth.dart';
import 'package:frontend/application/trainee/trainee.dart';
import 'package:frontend/application/Theme/theme.dart';


import '../weight/weight.dart';

// import 'package:fl_chart/fl_chart.dart' as charts;
class TrainerHomePage extends StatelessWidget {
  const TrainerHomePage({super.key});

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
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const HeaderBanner(),
                const ListOfTrainees(),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  // child: const TaskDatePickerHandeler(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfTrainees extends StatelessWidget {
  const ListOfTrainees({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeBloc, TraineeState>(
      builder: (context, state) {
        // if the state is loading, show a progress indicator
        if (state is TraineeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // if the trainees are loaded successfully
        else if (state is TraineeListLoadSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.trainees.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.trainees[index].fullName),
                subtitle: Text(state.trainees[index].email),
                onTap: () {
                  context.go('/trainee/${state.trainees[index].id}');
                },
              );
            },
          );
        }
        // The loading failed
        else if (state is TraineeOperationFailure) {
          return const Center(
            child: Text('👀 Failed to load trainees'),
          );
        }
        return const Center(
          child: Text('🏜 No trainees'),
        );
      },
    );
  }
}

