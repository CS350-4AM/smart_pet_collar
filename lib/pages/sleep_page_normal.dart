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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  const Divider(),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(CupertinoIcons.heart, size: 40,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          //Todo: DB와 연결하기?
                          Text('Average   76 bpm'),
                          SizedBox(height: 5),
                          Text('Highest    90 bpm'),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
