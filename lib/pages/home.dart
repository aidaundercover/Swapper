import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:swapper/const.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
    items: [
      TabItem(icon: Icons.location_on, title: 'Swap-events'),
      TabItem(icon: Icons.swap_horizontal_circle, title: 'Swap stuff'),
      TabItem(icon: Icons.add_circle_outline, title: 'Add'),
      TabItem(icon: Icons.clean_hands, title: 'Charity'),
      TabItem(icon: Icons.person, title: 'Profile'),
    ],
    initialActiveIndex: 0,
    backgroundColor: lightGreen,
    activeColor: white,
    height: 45,
    //optional, default as 0
  ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ]
        ),
      ),
    );
  }
}
