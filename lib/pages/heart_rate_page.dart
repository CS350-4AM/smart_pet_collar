import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    final Stream<QuerySnapshot> _sensorStream = FirebaseFirestore.instance
        .collection('heart sensor').orderBy('created_at', descending: true).limit(1).snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text('Heart Rate'),backgroundColor: kWhiteColor,
        elevation: 0,),
      body: SafeArea(
        child: Column(
          children: [
            //하트 아이콘
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: const Icon(CupertinoIcons.heart, size: 130),
            ),
            //sensor 값 Text
            Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: _sensorStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Container(child: const Text('Something went wrong')));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Container(child: const Text("Loading")));
                  }
                  try{
                    return Container(
                      child: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Center(
                          child: Builder(
                              builder: (context) {
                                return Text(
                                  (double.parse(data['heart_rate'])).round().toString()+' Bpm',
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                );}
                          ),
                        );
                      }).toList().first,
                    );
                  } catch(e) {
                    return Text('Cannot get heart rate.. e: '+ e.toString(), softWrap: true,);
                  }
                },
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                'assets/images/heart_graph.png',
                // height: 100,
              ),
            ),
            //아래 : Debug용
            // Container(
            //   height: 100,
            //   color: Colors.blueGrey,
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: _sensorStream,
            //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         return Container(color: Colors.red, child: const Text('Something went wrong'));
            //       }
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Container(color: Colors.red, child: const Text("Loading"));
            //       }
            //       return ListView(
            //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            //           return Container(
            //             height: 100,
            //             color: Colors.blue,
            //             child: ListTile(
            //               title: Builder(
            //                   builder: (context) {
            //                     return Text(data['heart_rate'].toString()+data['created_at'].toString());
            //                   }
            //               ),
            //               // subtitle: Text(data['company']),
            //             ),
            //           );
            //         }).toList(),
            //       );
            //     },
            //     // builder: (context, snapshot) {
            //     //   return Text("zzzzz: ${queryResult['0']} ${data['1']}");
            //     // }
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}