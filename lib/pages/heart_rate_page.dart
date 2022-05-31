import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HeartRatePage extends StatefulWidget {
  const HeartRatePage({Key? key}) : super(key: key);

  @override
  _HeartRatePageState createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text('Heart Rate'),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        child: LineChart(LineChartData()),
      ),
    );
  }
}
