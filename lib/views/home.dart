import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/profile/profile.dart';
import 'package:swapper/views/add_item/add_item.dart';
import 'package:swapper/views/swap_events/swap_event.dart';
import 'package:swapper/views/switch-swap/switch_swap.dart';
import 'package:swapper/views/charity/charity.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  final _pageOptions = [SwapEvents(), SwitchSwap(), AddItem(), Charity(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.location_on, title: 'Events'),
          TabItem(icon: Icons.swap_horizontal_circle, title: 'Swap stuff'),
          TabItem(icon: Icons.add_circle_outline, title: 'Add'),
          TabItem(icon: Icons.chat,title: 'Chat'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: selectedPage,
        backgroundColor: Color.fromRGBO(138,223,157, 1.0),
        activeColor: white,
        height: 45,
        onTap: (int i ){
            setState(() {
              selectedPage = i;
            });
          },
        //optional, default as 0
      ),
      backgroundColor: Colors.white,
      body: _pageOptions[selectedPage],
    );
  }
}
