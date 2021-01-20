import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:swapper/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final UserCredential user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: primaryColor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primaryColor,
        items: <Widget>[
          Icon(
            Icons.map,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.favorite_outline,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
        ],
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.bounceInOut,
        index: 2,
        height: 5,
        onTap: (index) {
          debugPrint('Current index is $index');
        },
      ),
    );
  }
}
