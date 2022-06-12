import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
    final Stream<QuerySnapshot> _sensorStream = FirebaseFirestore.instance.collection('heart sensor').orderBy('created_at', descending: true).limit(1).snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text('Breath Rate'),
      ),
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: const Icon(CupertinoIcons.wind, size: 130),
            ),
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
                                  //TODO: heart rate -> breathe rate 현재 constant: 0.25임
                                  (double.parse(data['heart_rate'])*0.25).round().toString()+'/min',
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
                'assets/images/breath_graph.png',
                // height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
