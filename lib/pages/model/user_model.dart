import 'package:cloud_firestore/cloud_firestore.dart';

class Userf {
  final String id;
  final String email;
  final String name;
  final String photoUrl;
  final String status;

  Userf({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.status,
  });

  factory Userf.fromDocument(DocumentSnapshot document) {
    return Userf(
      id: document['id'],
      email: document['email'],
      name: document['name'],
      photoUrl: document['photoUrl'],
      status: document['status'],
    );
  }
}
