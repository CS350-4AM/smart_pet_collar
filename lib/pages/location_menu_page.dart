import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/constants.dart';

class LocationMenuPage extends StatefulWidget {
  const LocationMenuPage({Key? key}) : super(key: key);

  @override
  _LocationMenuPageState createState() => _LocationMenuPageState();
}

class _LocationMenuPageState extends State<LocationMenuPage> {
  Completer<GoogleMapController> _controller = Completer();

  //kaist 좌표로 설정
  static final LatLng _kKaistlatLng = LatLng(36.374, 127.3656);
  static final CameraPosition _kKaist = CameraPosition(
      target: _kKaistlatLng,
      zoom: 19);

  final List<Marker> _markers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId("1"),
        onTap: () => print("Marker tapped!"),
        position: _kKaistlatLng,
        infoWindow: InfoWindow(title: "Current Location", ),
      )
    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text('Location'),
      ),
      backgroundColor: kWhiteColor,
      body: Container(
        child: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        initialCameraPosition: _kKaist,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          },
          myLocationButtonEnabled: false,
        ),

      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kKaist));
  // }
}
