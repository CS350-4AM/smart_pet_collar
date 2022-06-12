import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'home_page.dart';

class ConnectCollarPage extends StatefulWidget {
  const ConnectCollarPage({Key? key, this.username = 'default username'}) : super(key: key);
  final username;

  @override
  _ConnectCollarPageState createState() => _ConnectCollarPageState();
}

class _ConnectCollarPageState extends State<ConnectCollarPage> {
  final collarTextFieldController = TextEditingController();
  late String username;
  @override
  void initState() {
    super.initState();
    username = widget.username;
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    collarTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text('Connect Collar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 40),
                // Text('Sign in to start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: collarTextFieldController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Enter Collar ID',
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
                const SizedBox(height: 8),
                //Signin 버튼
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => HomePage(username: username)), (route) => false);
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
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
