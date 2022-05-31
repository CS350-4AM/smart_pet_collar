import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BreathRatePage extends StatefulWidget {
  const BreathRatePage({Key? key}) : super(key: key);

  @override
  _BreathRatePageState createState() => _BreathRatePageState();
}

class _BreathRatePageState extends State<BreathRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text('Breath Rate'),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(),
    );
  }
}
