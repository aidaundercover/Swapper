import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String photo;
  GeoPoint location;

  User(
      {this.uid,
      this.name,
      this.photo,
      this.location});
}
