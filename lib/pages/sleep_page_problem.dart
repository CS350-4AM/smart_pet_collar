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
              child: Text('Latest Sleep Has Problem.',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xffD00303))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                const SizedBox(height: 60),
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
                          Text('Average   72 bpm'),
                          SizedBox(height: 5),
                          Text('Highest    158 bpm', style: TextStyle(color: kRedColor),),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/sleep_problem_graph.png',
                    // height: 100,
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
