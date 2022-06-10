import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text('Activity'),
      ),
      backgroundColor: kWhiteColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                  radius: 80,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kWhiteColor, Color(0xffCC215C),],
                      ),
                    ),
                  ),
                ),
                  Column(
                    children: const [
                      Text('71%', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
                      Text('107 cal'),
                    ],
                  ),
                ]
              ),
              const SizedBox(height: 17),
              const Text('Activity Today'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          setState(() {
            isActivated = !isActivated;
          });
        },
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(!isActivated? 'Start Exercise': 'Stop Exercise', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 14),),
        ),
        // icon: const Icon(Icons.thumb_up, color: kWhiteColor,),
        backgroundColor: !isActivated? Colors.pink: Colors.black,
      ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
