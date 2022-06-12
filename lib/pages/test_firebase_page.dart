import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:smart_pet_collar/bluetooth_test/bluetooth_test_home_page.dart';
import 'package:smart_pet_collar/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_pet_collar/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/constants.dart';
class TestFirebasePage extends StatefulWidget {
  const TestFirebasePage({Key? key}) : super(key: key);

  @override
  _TestFirebasePageState createState() => _TestFirebasePageState();
}

class _TestFirebasePageState extends State<TestFirebasePage> {

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // Query queryGpsSensor = firestore.collection('GPS sensor').orderBy('createdAt', descending: true).limit(10);
    // QuerySnapshot queryResult;
    //
    // queryGpsSensor.limit(10).get().then((value) {
    //   queryResult = value;
    // });
    final Stream<QuerySnapshot> _sensorStream = FirebaseFirestore.instance.collection('breath sensor').snapshots();
    // final Stream<QuerySnapshot> _sensorStream = FirebaseFirestore.instance.collection('breath sensor').orderBy('createdAt', descending: true).limit(10).snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text('test firebase page'),backgroundColor: kWhiteColor,
        elevation: 0,),
      body: SafeArea(
          child: Container(
            color: Colors.blueGrey,
            child: StreamBuilder<QuerySnapshot>(
              stream: _sensorStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Container(color: Colors.red, child: const Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(color: Colors.red, child: const Text("Loading"));
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return Container(
                        height: 100,
                        color: Colors.blue,
                        child: ListTile(
                          title: Builder(
                            builder: (context) {
                              if (kDebugMode) {
                                print(data);
                                print(data['1'].runtimeType);
                                print(data['1']);
                              }
                              return Text(data['1'].toString());
                            }
                          ),
                          // subtitle: Text(data['company']),
                        ),
                      );
                    }).toList(),
                  );
                },
              // builder: (context, snapshot) {
              //   return Text("zzzzz: ${queryResult['0']} ${data['1']}");
              // }
            ),
          ),
      ),
    );
  }
}
