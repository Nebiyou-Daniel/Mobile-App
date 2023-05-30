import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/auth/auth.dart';
import 'package:frontend/trainee/trainee.dart';
import 'package:frontend/Theme/theme.dart';

import '../../custom_widgets/header_banner.dart';
import '../../weight/weight.dart';

// import 'package:fl_chart/fl_chart.dart' as charts;
class TrainerHomePage extends StatelessWidget {
  const TrainerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        // BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<TraineeBloc>(create: (context) => TraineeBloc()),
        // BlocProvider<WeightBloc>(create: (context) => WeightBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Workout Warrior",
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                HeaderBanner(),
                ListOfTrainees(),
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
        final traineeBloc = BlocProvider.of<TraineeBloc>(context);
        print(traineeBloc.state);

        // if the state is loading, show a progress indicator
        if (state is TraineeLoading) {
          print("Trainees loading");
          return const Center(
            child: LoadingParagraphWidget(numberOfLines: 13, message: "Loading your list of trainees... ",),
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
                title: Text(state.trainees[index].name),
                subtitle: Text(state.trainees[index].email),
                onTap: () {
                  context.push('/traineedetail/${state.trainees[index].id}');
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
        } else if (state is TraineeListEmpty) {
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

