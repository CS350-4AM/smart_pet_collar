import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SleepPageProblem extends StatefulWidget {
  const SleepPageProblem({Key? key}) : super(key: key);

  @override
  _SleepPageProblemState createState() => _SleepPageProblemState();
}

class _SleepPageProblemState extends State<SleepPageProblem> {
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
              child: Text('Latest Sleep Has Problem.',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
