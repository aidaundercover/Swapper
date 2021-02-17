import 'package:flutter/material.dart';
import 'package:swapper/routes.dart';
import 'package:swapper/net/auth_service.dart';

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
        FlatButton(
            onPressed: () {
              signOut();
              Navigator.of(context).pushNamed(AppRoutes.authLogin);
            },
            child: Text('Sign Out'))
      ],
    )));
  }
}
