import 'package:a_b_u_t_h_navigate/flutter_flow/flutter_flow_google_map.dart';
import 'package:a_b_u_t_h_navigate/pages/model/places_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;

class MapView11 extends StatefulWidget {
  Place? place_id;
  MapView11({
    Key? key,
    required this.place_id,
  }) : super(key: key);

  @override
  _MapView createState() => _MapView();
}

class _MapView extends State<MapView11> {
  @override
  void initState() {
    super.initState();
  }

  CameraPosition _kGooglePlex = CameraPosition(
    target: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
    zoom: 17.4746,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    ));
  }
}
