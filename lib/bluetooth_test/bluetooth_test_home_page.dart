// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
//
// import 'bluetooth_test_device_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final title = 'BLE Scan & Connection Demo';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: title,
//       home: MyHomePage(title: title),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   List<ScanResult> scanResultList = [];
//   bool _isScanning = false;
//
//   @override
//   initState() {
//     super.initState();
//     // 블루투스 초기화
//     initBle();
//   }
//
//   void initBle() {
//     // BLE 스캔 상태 얻기 위한 리스너
//     flutterBlue.isScanning.listen((isScanning) {
//       _isScanning = isScanning;
//       setState(() {});
//     });
//   }
//
//   /*
//   스캔 시작/정지 함수
//   */
//   scan() async {
//     if (!_isScanning) {
//       // 스캔 중이 아니라면
//       // 기존에 스캔된 리스트 삭제
//       scanResultList.clear();
//       // 스캔 시작, 제한 시간 4초
//       flutterBlue.startScan(timeout: Duration(seconds: 4));
//       // 스캔 결과 리스너
//       flutterBlue.scanResults.listen((results) {
//         scanResultList = results;
//         // UI 갱신
//         setState(() {});
//       });
//     } else {
//       // 스캔 중이라면 스캔 정지
//       flutterBlue.stopScan();
//     }
//   }
//
//   /*
//    여기서부터는 장치별 출력용 함수들
//   */
//   /*  장치의 신호값 위젯  */
//   Widget deviceSignal(ScanResult r) {
//     return Text(r.rssi.toString());
//   }
//
//   /* 장치의 MAC 주소 위젯  */
//   Widget deviceMacAddress(ScanResult r) {
//     return Text(r.device.id.id);
//   }
//
//   /* 장치의 명 위젯  */
//   Widget deviceName(ScanResult r) {
//     String name = '';
//
//     if (r.device.name.isNotEmpty) {
//       // device.name에 값이 있다면
//       name = r.device.name;
//     } else if (r.advertisementData.localName.isNotEmpty) {
//       // advertisementData.localName에 값이 있다면
//       name = r.advertisementData.localName;
//     } else {
//       // 둘다 없다면 이름 알 수 없음...
//       name = 'N/A';
//     }
//     return Text(name);
//   }
//
//   /* BLE 아이콘 위젯 */
//   Widget leading(ScanResult r) {
//     return CircleAvatar(
//       child: Icon(
//         Icons.bluetooth,
//         color: Colors.white,
//       ),
//       backgroundColor: Colors.cyan,
//     );
//   }
//
//   /* 장치 아이템을 탭 했을때 호출 되는 함수 */
//   void onTap(ScanResult r) {
//     // 단순히 이름만 출력
//     print('${r.device.name}');
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => DeviceScreen(device: r.device)),
//     );
//   }
//
//   /* 장치 아이템 위젯 */
//   Widget listItem(ScanResult r) {
//     return ListTile(
//       onTap: () => onTap(r),
//       leading: leading(r),
//       title: deviceName(r),
//       subtitle: deviceMacAddress(r),
//       trailing: deviceSignal(r),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         /* 장치 리스트 출력 */
//         child: ListView.separated(
//           itemCount: scanResultList.length,
//           itemBuilder: (context, index) {
//             return listItem(scanResultList[index]);
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return Divider();
//           },
//         ),
//       ),
//       /* 장치 검색 or 검색 중지  */
//       floatingActionButton: FloatingActionButton(
//         onPressed: scan,
//         // 스캔 중이라면 stop 아이콘을, 정지상태라면 search 아이콘으로 표시
//         child: Icon(_isScanning ? Icons.stop : Icons.search),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_blue/flutter_blue.dart';
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
// //
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //   late FlutterBlue flutterBlue;
// //   @override
// //   void initState() {
// //
// //     super.initState();
// //     flutterBlue = FlutterBlue.instance;
// //
// //   }
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }
// //
// //   void testBluetoothPluginScanForDevices(){
// //     print('executing testBluetoothPluginScanForDevices()..');
// //     // Start scanning
// //     flutterBlue.startScan(timeout: Duration(seconds: 4));
// //     // Listen to scan results
// //     var subscription = flutterBlue.scanResults.listen((results) {
// //       // do something with scan results
// //       for (ScanResult r in results) {
// //         print('${r.device.name} found! rssi: ${r.rssi}');
// //       }
// //     });
// //     // Stop scanning
// //     flutterBlue.stopScan();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Invoke "debug painting" (press "p" in the console, choose the
// //           // "Toggle Debug Paint" action from the Flutter Inspector in Android
// //           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// //           // to see the wireframe for each widget.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //             TextButton(onPressed: (){testBluetoothPluginScanForDevices();},child: const Text('test button'),),
// //             // TextButton(onPressed: (){await device.connect();}, child: const Text('connect device')),
// //             // TextButton(onPressed: (){device.disconnect();}, child: const Text('disconnect device'))
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
