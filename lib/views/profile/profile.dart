import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swapper/routes.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(onPressed: signOut, child: Text('Sign Out'))
      ],
    )));
  }

  Future signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed(AppRoutes.authLogin);
    } catch (e) {
      print(e.message);
    }
  }
}
