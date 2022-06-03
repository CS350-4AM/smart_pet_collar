import 'package:flutter/material.dart';
// import 'package:smart_pet_collar/bluetooth_test/bluetooth_test_home_page.dart';
import 'package:smart_pet_collar/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_pet_collar/utils/constants.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: kWhiteColor,
      ),
      home:
      HomePage(username: 'user name example',),
      //블루투스 연결 테스트 페이지를 home 으로 두고 싶다면 아래 코드를 사용하세요!
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

