import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../UI/common/loading.dart';
import '../../custom_widgets/line_chart.dart';
import '../weight.dart';


class WeightChartHandeler extends StatelessWidget {
  final int id;

  const WeightChartHandeler({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeightBloc>(
      create: (context) =>
          WeightBloc(), // Create and provide the WeightBloc instance
      child: BlocBuilder<WeightBloc, WeightState>(
        builder: (context, state) {
          final weightBloc = context
              .read<WeightBloc>(); // Use context.read to access the WeightBloc

          if (state is WeightInitial) {
            weightBloc.add(WeightLoadingEvent(userId: id));
            return const LoadingScreen();
          } else if (state is WeightLoading) {
            print("Weight loading");
            return const LoadingScreen();
          } else if (state is WeightLoadedSuccessfully) {
            print("Weight loaded successfully");
            return SizedBox(
              height: 300,
              child: WeightLineChart(
                weightData: state.weightData,
              ),
            );
          } else if (state is WeightLoadingError) {
            print("Weight loaded Error");
            return const Center(
              child: Text('👀 Failed to load weight'),
            );
          } else {
            return const LoadingScreen();
          }
        },
      ),
    );
  }
}
