import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController repasswordController = TextEditingController();

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('User');

  String uid = auth.currentUser.uid.toString();
  users.add({'displayName': displayName, 'uid': uid});
  return;
}

Future<void> signIn() async {
  final formState = _formKey.currentState;
  if (formState.validate()) {
    formState.save();
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('displayName', user.user.displayName);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for the email');
      }
    } catch (e) {
      print(e.message);
    }
  }
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

Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: usernameController.text);
        userSetup(usernameController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print('The account already exists for that email');
        }
      } catch (e) {
        print(e.message);
      }
    }
  }