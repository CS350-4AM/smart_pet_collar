import 'package:flutter/material.dart';
import 'package:smart_pet_collar/utils/constants.dart';

class EmotionPage extends StatefulWidget {
  const EmotionPage({Key? key}) : super(key: key);

  @override
  _EmotionPageState createState() => _EmotionPageState();
}

class _EmotionPageState extends State<EmotionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion'),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Container(),
    );
  }
}
