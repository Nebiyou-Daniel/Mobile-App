import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightLineChart extends StatelessWidget {
  final Map<double, double> weightData;
  const WeightLineChart({super.key, required this.weightData});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsData = [];
    for (var entry in weightData.keys) {
      spotsData.add(FlSpot(entry, weightData[entry]!));
    }

    double maxWeight = weightData.values.reduce((a, b) => a > b ? a : b);
    double maxX = weightData.keys.reduce((a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
          minX: 0.5,
          maxX: maxX + 10,
          minY: 1,
          maxY: maxWeight + 10,
          lineBarsData: [
            LineChartBarData(
              barWidth: 4,
              color: const Color(0xff23bee6),
              spots: spotsData,
            )
          ]),
    );
  }
}
