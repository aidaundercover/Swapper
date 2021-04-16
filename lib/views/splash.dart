import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: green,
      body: Container(
        width: size.width,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 226,
          )
          ),
        ),
    );
  }
}
