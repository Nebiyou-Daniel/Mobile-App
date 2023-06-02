import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_screens/loading.dart';
import '../../custom_widgets/line_chart.dart';
import '../../../application/weight/weight.dart';

class WeightChartHandler extends StatelessWidget {
  final int id;

  const WeightChartHandler({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeightBloc>(
      create: (context) => WeightBloc()..add(WeightLoadingEvent()),
      child: BlocConsumer<WeightBloc, WeightState>(
        listener: (context, state) {
          if (state is WeightOperationSuccess) {
            context.read<WeightBloc>().add(WeightLoadingEvent());
          }
        },
        builder: (context, state) {
          if (state is WeightLoading) {
            return const LoadingScreen();
          } else if (state is WeightLoadingError) {
            // an error message and reload button

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error),
                ElevatedButton(
                  onPressed: () {
                    context.read<WeightBloc>().add(WeightLoadingEvent());
                  },
                  child: const Text("Reload"),
                ),
              ],
            );
          } else if (state is WeightInitial) {
            return const LoadingScreen();
          } else if (state is WeightLoadedSuccessfully) {
            if (state.weightData.isEmpty) {
              return const Text(
                  "No weight added yet. Add your weight in the profile to see the chart.");
            }
            return SizedBox(
              height: 300,
              child: WeightLineChart(
                weightData: state.weightData,
              ),
            );
          }
          return const Text("Unexpected State");
        },
      ),
    );
  }
}
