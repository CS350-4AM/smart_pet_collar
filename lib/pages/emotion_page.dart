import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pet_collar/utils/constants.dart';

class EmotionPage extends StatefulWidget {
  const EmotionPage({Key? key}) : super(key: key);

  @override
  _EmotionPageState createState() => _EmotionPageState();
}

class _EmotionPageState extends State<EmotionPage> {

  Color getColor(String e){
    if(e == 'GOOD') {
      return Colors.black;
    } else if(e == 'UNCOMFORT') {
      return Colors.deepOrangeAccent;
    } else {
      return kRedColor;
    }
  }

  IconData getIconData(String e){
    if(e == 'GOOD') {
      return Icons.sentiment_satisfied_rounded;
    } else if(e == 'UNCOMFORT') {
      return Icons.sentiment_neutral_rounded;
    } else {
      return Icons.sentiment_dissatisfied_rounded;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _sensorStream = FirebaseFirestore.instance.collection('heart sensor').orderBy('created_at', descending: true).limit(1).snapshots();
    String emotion = 'Default..';
    return Scaffold(
      appBar: AppBar(title: const Text('Emotion'),backgroundColor: kWhiteColor, elevation: 0,),
      body: StreamBuilder<QuerySnapshot>(
        stream: _sensorStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasError) {
            return Container(color: Colors.red, child: const Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(color: Colors.red, child: const Text("Loading"));
          }
          try{
            return Container(
              child: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                //Todo: 각 기준값 논문 조사?
                if(double.parse(data['heart_rate'].toString())<90){
                  // setState(() {
                    emotion = 'GOOD';
                  // });
                }
                else if(double.parse(data['heart_rate'].toString())<120){
                  // setState(() {
                    emotion = 'UNCOMFORT';
                  // });
                }
                else {
                  // setState(() {
                    emotion = 'BAD';
                  // });
                }

                return Column(
                  children: [
                    //설명 : Emotion에 따른 표정 아이콘
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                      child: Icon(getIconData(emotion), size: 130),
                    ),
                    //설명 : Emotion Text - Good or Uncomfort or Bad
                    Builder(
                      builder: (context) {
                        if(emotion=='GOOD'){
                          return Text('Good', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),);
                        } else if (emotion == 'UNCOMFORT') {
                          return Text('Uncomfort', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.deepOrange),);
                        } else {
                          return Text('Bad', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.red),);
                        }
                      }
                    ),
                    //설명 : Divider로 분리된 heart rate, breath rate 정보
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          SizedBox(height: 60),
                          const Divider(),
                          //설명 : heart rate 정보 widget
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(CupertinoIcons.heart, size: 40,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      double.parse(data['heart_rate']).round().toString() + ' Bpm',
                                      style: TextStyle(color: getColor(emotion)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          //설명 : breathe rate 정보 widget
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(CupertinoIcons.wind, size: 40,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // data['created_at'].toString(),
                                    (double.parse(data['heart_rate'])*0.25).round().toString() + '/min',
                                      style: TextStyle(color: getColor(emotion)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList().first,
            );
          } catch(e) {
            return Text('Cannot get heart rate.. e: '+ e.toString(), softWrap: true,);
          }
        },
      ),
    );
  }
}
