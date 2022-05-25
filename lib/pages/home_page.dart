import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pet_collar/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final title = 'Home Page';
  @override
  _HomePageState createState() => _HomePageState();
}
getMediaQueryWidth(context)=> MediaQuery.of(context).size.width;
class _HomePageState extends State<HomePage> {
  //late : 선언은 미리, initialization은 runtime에.
  //final : 한번 initialization 되면 값이 바뀌지 않음.
  //static :
  //const :
  static const double outerHorizontalPaddingWidth = 18;
  static const double spacingBetweenWidgetsWidth = 11;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = getMediaQueryWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(widget.title, style: const TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPaddingWidth),
        color: kBackgroundColor,
        child: ListView(

          children: [
            Row(
              children: [
                MenuCardWidget(
                  title: 'Menu 1',
                  iconData: CupertinoIcons.location_circle,
                  width: (mediaQueryWidth-outerHorizontalPaddingWidth*2-spacingBetweenWidgetsWidth)/2,
                ),
                const SizedBox(width: spacingBetweenWidgetsWidth),
                MenuCardWidget(
                  title: 'Menu 2',
                  iconData: CupertinoIcons.heart,
                  width: (mediaQueryWidth-outerHorizontalPaddingWidth*2-spacingBetweenWidgetsWidth)/2,
                ),
              ],
            ),
            Row(),
            Row(),
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

  }) : super(key: key);
  final double width;
  final String title; //? means nullable : call site에서 잘 해야 함
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xffF7F7F7),
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
