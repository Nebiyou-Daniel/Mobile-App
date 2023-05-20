import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightLineChart extends StatelessWidget {
  const WeightLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 1,
        maxY: 7,
      )
    );
  }
}
