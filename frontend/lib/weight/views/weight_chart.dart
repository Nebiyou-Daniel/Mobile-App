import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../UI/common/loading.dart';
import '../../custom_widgets/line_chart.dart';
import '../weight.dart';

class WeightChartHandler extends StatelessWidget {
  final int id;

  const WeightChartHandler({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeightBloc>(
      create: (context) => WeightBloc()..add(WeightLoadingEvent()),
      child: Builder(builder: (context) {
        final weightBloc = context.watch<WeightBloc>();
        final weightState = weightBloc.state;
        print(weightState);

        if (weightState is WeightLoading) {
          return LoadingScreen();
        } else if (weightState is WeightLoadingError) {
          // weightBloc.add(WeightLoadingEvent());
          return const Text("Error loading weight data");
        } else if (weightState is WeightInitial) {
          weightBloc.add(WeightLoadingEvent(userId: id));
          return const LoadingScreen();
        } else if (weightState is WeightLoadedSuccessfully) {
          final _state = weightState as WeightLoadedSuccessfully;
          print("I have entererd the weight loaded successfull page");
          Map<double, double> weightData = _state.weightData;
          return SizedBox(
            height: 300,
            child: WeightLineChart(
              weightData: weightData,
            ),
          );
        }
        return Container(
          child: Text("Unexpected State"),
        );
      }),
    );
  }
}
