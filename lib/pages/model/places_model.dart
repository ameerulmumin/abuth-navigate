import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  Timestamp date;
  String id;
  String image;
  GeoPoint latLng;
  String name;

  Place({
    required this.date,
    required this.id,
    required this.image,
    required this.latLng,
    required this.name,
  });

  factory Place.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Place(
      date: data['date'] ?? '',
      id: data['id'] ?? '',
      image: data['image'] ?? '',
      latLng: data['lat_lng'] ?? GeoPoint(0.0, 0.0), // Assuming default value
      name: data['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'id': id,
      'image': image,
      'lat_lng': latLng,
      'name': name,
    };
  }
}

class PlaceSub {
  String CONTRIBUTOR;
  Timestamp DATE_ADDED;
  String DESCRIPTION;
  List<dynamic> IMAGES;
  GeoPoint LAT_LNG;
  String NAME;
  String NAME_ID;

  PlaceSub({
    required this.CONTRIBUTOR,
    required this.DATE_ADDED,
    required this.DESCRIPTION,
    required this.IMAGES,
    required this.LAT_LNG,
    required this.NAME,
    required this.NAME_ID,
  });

  factory PlaceSub.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return PlaceSub(
      CONTRIBUTOR: data['CONTRIBUTOR'] ?? '',
      DATE_ADDED: data['DATE_ADDED'] ?? '',
      DESCRIPTION: data['DESCRIPTION'] ?? '',
      IMAGES: data['IMAGES'] ?? [],
      LAT_LNG: data['LAT_LNG'] ?? GeoPoint(0.0, 0.0), // Assuming default value
      NAME: data['NAME'] ?? '',
      NAME_ID: data['NAME_ID'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CONTRIBUTOR': CONTRIBUTOR,
      'DATE_ADDED': DATE_ADDED,
      'DESCRIPTION': DESCRIPTION,
      'IMAGES': IMAGES,
      'LAT_LNG': LAT_LNG,
      'NAME': NAME,
      'NAME_ID': NAME_ID,
    };
  }
}


// Define a Place class to store search results
class PlaceSearch {
  final String name;
  final String address;
  final double lat;
  final double lng;

  PlaceSearch({
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      name: json['name'],
      address: json['formatted_address'],
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
    );
  }
}

