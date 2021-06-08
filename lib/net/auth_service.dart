import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController passwordControllerSignIn = TextEditingController();
TextEditingController emailControllerSignIn = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController repasswordController = TextEditingController();
TextEditingController emailRecover = TextEditingController();

String warning;

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('User');

  String uid = auth.currentUser.uid.toString();
  users.add({'displayName': displayName, 'uid': uid});
  return;
}

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = await _auth.currentUser;
  assert(currentUser.uid == user.uid);

  return user;
}

Future signOut() async {
  try {
    FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e.message);
  }
}

Future sendPasswordResetEmail(String email) async {
  return _auth.sendPasswordResetEmail(email: email);
}

Future<String> getCurrentUID() async {
  return (_auth.currentUser).uid;
}

Future getCurrentUser() async {
  return _auth.currentUser;
}

Stream<String> get onAuthStateChanged => _auth.authStateChanges().map(
      (User user) => user?.uid,
    );


getProfileImage() {
    if(_auth.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }