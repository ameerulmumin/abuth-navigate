import 'package:a_b_u_t_h_navigate/pages/model/places_model.dart';

import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;

const kGoogleApiKey = "AIzaSyBeBTVvMhOPReV83q6mu0xyMAJGKs3-w78";

class PlaceR {
  final String name;
  final String address;
  final double rating;
  final String placeId;

  PlaceR({
    required this.name,
    required this.address,
    required this.rating,
    required this.placeId,
  });

  factory PlaceR.fromJson(Map<String, dynamic> json) {
    return PlaceR(
      name: json['name'],
      address: json['formatted_address'],
      rating: json['rating'] ?? 0.0,
      placeId: json['place_id'],
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition _kGooglePlex = CameraPosition(
    target: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
    zoom: 17.4746,
  );
  static final Marker _kGooglePlexerMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
  );
  static final Polyline _kPolyline = Polyline(
    polylineId: PolylineId('_kPolyline'),
    points: [
      google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
      //LatLng(11.176243145719374, 7.604854368697713),
    ],
    width: 5,
  );
  static final Polygon _kPolygon = Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      google_maps_flutter.LatLng(11.1762430, 7.6048540),
      google_maps_flutter.LatLng(11.10345, 7.36175),
    ],
    strokeWidth: 5,
    fillColor: Colors.transparent,
  );
  late HomePageModel _model;
  TextEditingController _searchController = TextEditingController();
  List<PlaceR> _searchResults = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: google_maps_flutter.LatLng(lat, lng), zoom: 12)));
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    loadResponse();
    _model.textController ??= TextEditingController();
  }

  void loadResponse() async {
    final apiKey =
        'AIzaSyCf2_5Ua_9LhjsgUulB7hl3POyGHoALw3M'; // Replace with your actual API key
    final query = 'restaurants in New York'; // Replace with your search query

    try {
      final places = await searchPlaces(query, apiKey);
      for (var place in places) {
        print('Name: ${place['name']}');
        print('Address: ${place['formatted_address']}');
        print('Rating: ${place['rating']}');
        print('Place ID: ${place['place_id']}');
        print('---');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Set<Marker> _markers = {};

  handleSearchResult(List<PlaceSearch> places) {
    for (var place in places) {
      _markers.add(
        Marker(
          markerId: MarkerId(place.name),
          position:
              google_maps_flutter.LatLng(11.199420079657564, 7.603154597605352),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.address,
          ),
          onTap: () {
            _onMarkerTapped(
                MarkerId(
                  place.name,
                ),
                places);
          },
        ),
      );
    }
  }

  void showDailogue(BuildContext context, List<PlaceSearch> places) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Place'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final place = _searchResults[index];
                return ListTile(
                  title: Text(place.name),
                  subtitle: Text(place.address),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle the "Cancel" button
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _handlePlaceSelection(BuildContext context, PlaceSearch selectedPlace) {
    // You can now use the selectedPlace for further actions, such as navigation, etc.

    // Close the dialog
    Navigator.of(context).pop();
  }

  void _onMarkerTapped(MarkerId markerId, List<PlaceSearch> places) {
    // Implement actions when a marker is tapped here
    PlaceSearch selectedPlace =
        places.firstWhere((place) => place.name == markerId.value);

    // Show a dialog with more information
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedPlace.name),
          content: Text(selectedPlace.address),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<List<dynamic>> searchPlaces(String query, String apiKey) async {
    final baseUrl =
        'https://maps.googleapis.com/maps/api/place/textsearch/json';
    final queryParams = {
      'query': query,
      'key': apiKey,
    };

    final uri = Uri.https(baseUrl, '', queryParams);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results;
      } else {
        throw Exception('Failed to load places');
      }
    } catch (error) {
      // Handle the error here
      print(error);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                markers: {
                  _kGooglePlexerMarker,
                  _kLakeMarker,
                },
                polylines: {
                  _kPolyline,
                },
                polygons: {
                  _kPolygon,
                },
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
