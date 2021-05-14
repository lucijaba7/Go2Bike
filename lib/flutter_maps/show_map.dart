import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowGoogleMap extends StatefulWidget {
  @override
  _ShowGoogleMapState createState() => _ShowGoogleMapState();
}

class _ShowGoogleMapState extends State<ShowGoogleMap> {
  // GoogleMapController mapController;
  // final LatLng _center = const LatLng(44.8683, 13.8481);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: CameraPosition(target: _center, zoom: 15.0)
      // ),
    );
  }
}
