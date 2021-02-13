import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swapper/net/auth_service.dart';


String imageURL;

addToCloud() {
  Map<String, dynamic> userData = {
    "username": "$usernameController",
    "email": "$emailController"
  };

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  collectionReference.add(userData);
}


