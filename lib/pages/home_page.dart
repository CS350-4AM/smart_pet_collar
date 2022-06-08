import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pet_collar/pages/activity_page.dart';
import 'package:smart_pet_collar/pages/emotion_page.dart';
import 'package:smart_pet_collar/pages/location_menu_page.dart';
import 'package:smart_pet_collar/pages/sleep_page_normal.dart';
import 'package:smart_pet_collar/pages/test_firebase_page.dart';
import 'package:smart_pet_collar/utils/constants.dart';

import 'breath_rate_page.dart';
import 'heart_rate_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.username = 'default username'}) : super(key: key);
  final username;
  final title = 'Smart Pet Collar';
  @override
  _HomePageState createState() => _HomePageState();
}
getMediaQueryWidth(context)=> MediaQuery.of(context).size.width;
class _HomePageState extends State<HomePage> {
  //late : 선언은 미리, initialization은 runtime에.
  //final : 한번 initialization 되면 값이 바꿀수 없음.
  //static :
  //const :
  static const double outerHorizontalPaddingWidth = 18;
  static const double spacingBetweenWidgetsWidth = 11;
  late String username;
  @override
  void initState() {
    super.initState();
    username = widget.username;
  }
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = getMediaQueryWidth(context);
    double menuCardWidgetWidth = (mediaQueryWidth-outerHorizontalPaddingWidth*2-spacingBetweenWidgetsWidth)/2;
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kMidGreyColor.withOpacity(0.5),
              ),
              child: Text(username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.black),),
        backgroundColor: kWhiteColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
              },
              icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPaddingWidth),
        color: kWhiteColor,
        child: ListView(
          children: [
            Row(
              children: [
                MenuCardWidget(
                  title: 'Location',
                  iconData: CupertinoIcons.location_circle,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LocationMenuPage()));},
                ),
                const SizedBox(width: spacingBetweenWidgetsWidth),
                MenuCardWidget(
                  title: 'Activity',
                  iconData: CupertinoIcons.paw,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage()));},
                ),
              ],
            ),
            Row(
              children: [
                MenuCardWidget(
                  title: 'Heart Rate',
                  iconData: CupertinoIcons.heart,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HeartRatePage()));},
                ),
                const SizedBox(width: spacingBetweenWidgetsWidth),
                MenuCardWidget(
                  title: 'Breath Rate',
                  iconData: CupertinoIcons.wind,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BreathRatePage()));},
                ),
              ],
            ),
            Row(
              children: [
                MenuCardWidget(
                  title: 'Sleep',
                  iconData: CupertinoIcons.moon,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SleepPageNormal()));},
                ),
                const SizedBox(width: spacingBetweenWidgetsWidth),
                MenuCardWidget(
                  title: 'Emotion',
                  iconData: CupertinoIcons.smiley,
                  width: menuCardWidgetWidth,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EmotionPage()));},
                ),
              ],
            ),
            //test_firebase_page 쓰고 싶으면 아래를 주석 해제
            // TextButton(
            //   onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TestFirebasePage()),);},
            //   child: const Text('Go to page for testing firebase'),
            // ),
          ],
        ),
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    Key? key,
    required this.width,
    required this.title,
    required this.iconData,
    required this.onPressed

  }) : super(key: key);
  final double width;
  final String title; //? means nullable : call site에서 잘 해야 함
  final IconData iconData;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: kLightGreyColor,
          ),
          width: width,
          height: width,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.black),),
              Expanded(
                child: Center(
                  child: Icon(
                    iconData,
                    size: 60,
                    color: Colors.black,
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
