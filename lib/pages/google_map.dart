//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'dart:async';
//
//class GoogleMaps extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return GoogleMapState();
//  }
//}
//
//class GoogleMapState extends State<GoogleMaps> {
//  Completer<GoogleMapController> _controller = Completer();
//
//  static const LatLng _center = LatLng(45.521563, -122.677433);
//
//  void _onMapCreate(GoogleMapController controller) {
//    _controller.complete(controller);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: GoogleMap(
//        onMapCreated: _onMapCreate,
//        initialCameraPosition: CameraPosition(
//          target: _center,
//          zoom: 11.0,
//        ),
//      ),
//    );
//  }
//}
