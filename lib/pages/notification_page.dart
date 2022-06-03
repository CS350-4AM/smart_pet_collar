import 'package:flutter/material.dart';
import 'package:smart_pet_collar/pages/sleep_page_problem.dart';
import 'package:smart_pet_collar/utils/constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text('Notifications'),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Divider(),
                TextButton(
                  onPressed: (){
                    //TODO: go to sleep page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SleepPageProblem()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.warning_amber_rounded, color: Colors. black,),
                        SizedBox(width: 20),
                        Flexible(child: Text('[Emergency] Sleep - High heart rate \nMay have trouble during sleep. Check your pet’s condition immediately. ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),)),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
