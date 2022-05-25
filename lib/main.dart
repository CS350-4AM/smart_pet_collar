import 'package:flutter/material.dart';
import 'package:smart_pet_collar/bluetooth_test/bluetooth_test_home_page.dart';
import 'package:smart_pet_collar/pages/home_page.dart';

void main() {
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
      // HomePage(),
      //블루투스 연결 테스트 페이지를 home 으로 두고 싶다면 아래 코드를 사용하세요!
      MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

