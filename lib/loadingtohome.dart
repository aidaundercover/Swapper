import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swapper/routes.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupHome() async {
   Navigator.of(context).pushNamed(AppRoutes.home);
  }

  @override
  void initState() {
    super.initState();
    setupHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      body: Center(
        child: SpinKitChasingDots(color: green, size: 40),
      ),
    );
  }
}
