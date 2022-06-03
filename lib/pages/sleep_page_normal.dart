import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SleepPageNormal extends StatefulWidget {
  const SleepPageNormal({Key? key}) : super(key: key);

  @override
  _SleepPageNormalState createState() => _SleepPageNormalState();
}

class _SleepPageNormalState extends State<SleepPageNormal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heart Rate'),backgroundColor: kWhiteColor,
        elevation: 0,),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: const Icon(CupertinoIcons.moon, size: 130),
            ),
            const Center(
              child: Text('Latest Sleep is Normal.',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
