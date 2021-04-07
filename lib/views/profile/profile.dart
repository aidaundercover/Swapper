import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/widgets/drawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenWhite,
          toolbarHeight: 46,
          title: Text(
            'PROFILE',
            style: TextStyle(
                color: green,
                fontSize: 14,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold),
          ),
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, size: 25, color: green),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search, size: 25, color: green),
                onPressed: () {}),
          ],
        ),
        drawer: DrawerCustom(),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 136,
              color: lightGreen,
              child: Center(
                child: Icon(Icons.person, color: white, size: 96),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 215,
              color: white,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 139,
                child: Column(children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('$name',
                              style: TextStyle(
                                  color: green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial')
                            ),
                            Text('$locationAddress',
                              style: TextStyle(
                                  color: green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial')
                            )
                        ],
                      )
                    ],
                  )
                ]),
              ),
            )
          ],
        )));
  }
}
