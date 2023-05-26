import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightLineChart extends StatelessWidget {
  WeightLineChart(this.timeIn, {super.key});

  final String timeIn;
  int maximumX = 0;

  @override
  Widget build(BuildContext context) {
    switch (timeIn) {
      case "oneMonth":
        maximumX = 6;
        break;
      case "sixMonth":
        maximumX = 7;
        break;
      case "oneYear":
        maximumX = 13;
        break;
    }

    return LineChart(
      LineChartData(
        minX: 0.5, 
        maxX: maximumX.toDouble() - 0.5, 
        minY: 1, 
        maxY: 6, 
        lineBarsData: [
          LineChartBarData(
            barWidth: 4, 
            color: const Color(0xff23bee6), 
            spots: [
              const FlSpot(1, 2.5),
              const FlSpot(2, 3),
              const FlSpot(2.6, 2),
              const FlSpot(4.9, 5),
              const FlSpot(5.8, 2.5),
              const FlSpot(6, 4),

          ])
        ]),
    );
  }
}

class CustomSpot extends StatelessWidget {
  CustomSpot(this.timeIn, {super.key});

  final String timeIn;

  Map<String, int> twelveMonthsAndNumbers = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
