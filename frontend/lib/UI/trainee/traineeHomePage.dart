import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Task/task.dart';
import '../../Task/views/traineeTask.dart';
import '../../custom_widgets/date_picker.dart';
import '../../custom_widgets/line_chart.dart';

import 'package:frontend/auth/auth.dart';
import 'package:frontend/trainee/trainee.dart';
import 'package:frontend/Theme/theme.dart';

import '../../Custom_Widgets/header_banner.dart';
import '../../weight/weight.dart';

// import 'package:fl_chart/fl_chart.dart' as charts;
class TraineeHomePage extends StatelessWidget {
  const TraineeHomePage({Key? key}) : super(key: key);

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
                SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 180,
                    child: const WeightChartHandeler()),
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
        ),
      ),
    );
  }
}

class WeightChartHandeler extends StatelessWidget {
  const WeightChartHandeler({super.key});

  @override
  Widget build(BuildContext context) {
    final weightBloc = context.watch<WeightBloc>();
    final weightBlocState = weightBloc.state;

    if (weightBlocState is WeightInitial) {
      weightBloc.add(WeightLoadingEvent());
      return const SizedBox();
    } else if (weightBlocState is WeightLoading) {
      return const LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
        backgroundColor: Color.fromARGB(196, 158, 158, 158),
        minHeight: 180,
        semanticsLabel: "Loading your weight data",
      );
    } else if (weightBlocState is WeightLoadedSuccessfully) {
      return WeightLineChart(weightData: weightBlocState.weightData);
    }
    if (weightBlocState is WeightLoadingError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          content: Text(weightBlocState.error),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Container();
  }
}

class TaskDatePickerHandeler extends StatelessWidget {
  const TaskDatePickerHandeler({super.key});

  @override
  Widget build(BuildContext context) {
    return const TraineeTask();
  }
}
