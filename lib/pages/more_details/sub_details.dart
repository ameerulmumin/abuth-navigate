import 'package:a_b_u_t_h_navigate/pages/model/places_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceSub? placeSub;
  PlaceDetailScreen({required this.placeSub});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Place Images Carousel
            Container(
              height: 200,
              child: PageView.builder(
                itemCount: placeSub!.IMAGES.length,
                itemBuilder: (context, index) {
                  return Image.network(placeSub!.IMAGES[index],
                      fit: BoxFit.cover);
                },
              ),
            ),
            // Place Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                placeSub!.NAME,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Place Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                placeSub!.DESCRIPTION,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Map View
            Container(
              height: 200,
              margin: EdgeInsets.all(16.0),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      placeSub!.LAT_LNG.latitude, placeSub!.LAT_LNG.longitude),
                  zoom: 15.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('place_marker'),
                    position: LatLng(placeSub!.LAT_LNG.latitude,
                        placeSub!.LAT_LNG.longitude),
                    infoWindow: InfoWindow(
                      title: placeSub!.NAME,
                    ),
                  ),
                },
                onMapCreated: (GoogleMapController controller) {
                  // Set up the map controller and other map options
                  // You can interact with the map here
                },
                onTap: (LatLng location) {
                  // Open Google Maps when the map is tapped
                  final mapUrl =
                      'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
                  launch(mapUrl);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate back to the previous screen when the FAB is pressed
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
