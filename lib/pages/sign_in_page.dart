import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pet_collar/pages/home_page.dart';

import '../utils/constants.dart';
import 'join_us_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset('assets/images/puppy@3x.png', height: 100,),
              const SizedBox(height: 12),
              const Text('Smart Pet Collar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(username: idTextFieldController.text,)), (route) => false);
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
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: TextButton(
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JoinUsPage()));
                      },
                        child: const Text(
                        'Join Us',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kBlueColor,
                        ),),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){},
                        child: const Text(
                        'Forgot ID/Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
