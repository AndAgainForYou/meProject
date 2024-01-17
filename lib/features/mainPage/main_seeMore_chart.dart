import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeightMainPageChart extends StatefulWidget {
  const WeightMainPageChart({Key? key}) : super(key: key);

  @override
  State<WeightMainPageChart> createState() => _WeightMainPageChartState();
}

class _WeightMainPageChartState extends State<WeightMainPageChart> {
  final List<FlSpot> dummyData1 = [
    const FlSpot(5, 60),
    const FlSpot(6, 70),
    const FlSpot(7, 65),
  ];

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = [
    const FlSpot(5, 60),
    const FlSpot(6, 65),
    const FlSpot(7, 80),
  ];

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = [
    const FlSpot(5, 60),
    const FlSpot(6, 70),
    const FlSpot(7, 88),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width * 1,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // The red line
            LineChartBarData(
              spots: dummyData1,
              isCurved: true,
              barWidth: 2,
              color: Colors.green,
            ),
            // The orange line
            LineChartBarData(
              spots: dummyData2,
              isCurved: true,
              barWidth: 2,
              color: Colors.red,
            ),
            // The blue line
            LineChartBarData(
              spots: dummyData3,
              isCurved: false,
              barWidth: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }
}
