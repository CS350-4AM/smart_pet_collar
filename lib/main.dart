import 'package:flutter/material.dart';
// import 'package:smart_pet_collar/bluetooth_test/bluetooth_test_home_page.dart';
import 'package:smart_pet_collar/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection('sensor');
    // print(collectionReference);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home:
        Scaffold(body: SafeArea(
          child: Container(
            child: FutureBuilder<DocumentSnapshot>(
              future: collectionReference.doc('heartrate').get(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                if (snapshot.hasError) {
                  print(snapshot);
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                }

                return Text("loading");
              },
            ),
          ),
        ),
        ),
      // HomePage(),
      //블루투스 연결 테스트 페이지를 home 으로 두고 싶다면 아래 코드를 사용하세요!
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

