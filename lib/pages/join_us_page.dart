import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pet_collar/pages/connect_collar_page.dart';

import '../utils/constants.dart';

class JoinUsPage extends StatefulWidget {
  const JoinUsPage({Key? key}) : super(key: key);

  @override
  _JoinUsPageState createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              const Text('Create Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 40),
              // Text('Sign in to start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: idTextFieldController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'ID',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: kMidGreyColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: kMidGreyColor)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: pwTextFieldController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Color(0xffcccccc))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: Color(0xffcccccc))),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              //Signin 버튼
              SizedBox(
                width: double.infinity,
                height: 45,
                child: TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ConnectCollarPage(username: idTextFieldController.text,)), (route) => false);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(kBlueColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      )
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
