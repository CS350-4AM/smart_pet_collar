import 'package:flutter/material.dart';

import '../utils/constants.dart';

class LocationMenuPage extends StatefulWidget {
  const LocationMenuPage({Key? key}) : super(key: key);

  @override
  _LocationMenuPageState createState() => _LocationMenuPageState();
}

class _LocationMenuPageState extends State<LocationMenuPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text('Location'),
      ),
      backgroundColor: kWhiteColor,
      body: Container(),
    );
  }
}
