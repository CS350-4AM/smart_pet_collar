import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_pet_collar/pages/sign_in_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/puppy@3x.png', height: 100,),
              SizedBox(height: 12,),
              Text('Smart Pet Collar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
