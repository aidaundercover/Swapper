import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:swapper/routes.dart';
import 'package:swapper/net/auth_service.dart';
import 'dart:async';

class DrawerCustom extends StatefulWidget {
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isSwitched = false;
  StreamSubscription<Position> _streamSubscription;
  Address addres;

  @override
  void initState() {
    super.initState();

    _streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => addres = value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color.fromRGBO(245, 245, 245, 1.0),
          child: Column(
            children: [
              Flexible(
                flex: 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(color: green, boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ]),
                          height: 143,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              minRadius: 27,
                                              maxRadius: 32,
                                              backgroundColor: white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "A",
                                                  style: TextStyle(
                                                      fontSize: 35.0,
                                                      color: greenSlight),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              "Amira Artykbaeva",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "amiraartykbaeva@gmail.com",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                              textAlign: TextAlign.start,
                                            ),
                                          ]),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.more_vert_rounded,
                                          size: 20, color: Colors.black),
                                      onPressed: () {},
                                    )
                                  ]),
                            ],
                          )),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.location_on_rounded,
                                    size: 23, color: Colors.red),
                                SizedBox(width: 15),
                                Text(
                                    " $locationAddress",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Image(
                                    image: AssetImage('assets/images/coin.png'),
                                    width: 23,
                                    height: 23),
                                SizedBox(width: 15),
                                Text('1 coins',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                ImageIcon(AssetImage('assets/images/help.png'),
                                    size: 23,
                                    color: Color.fromRGBO(221, 195, 126, 1.0)),
                                SizedBox(width: 15),
                                Text('Charity',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.map, size: 23, color: green),
                                SizedBox(width: 15),
                                Text('Swap-events map',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Icon(Icons.settings,
                                    size: 23,
                                    color: Color.fromRGBO(92, 92, 92, 1.0)),
                                SizedBox(width: 15),
                                Text('Settings',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: IconButton(
                                    icon: Icon(Icons.chevron_right_rounded,
                                        size: 25, color: Colors.black),
                                    onPressed: () {}),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                      Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                ImageIcon(AssetImage('assets/images/bulb.png'),
                                    size: 23,
                                    color: isSwitched
                                        ? Colors.yellow
                                        : Color.fromRGBO(42, 39, 112, 1.0)),
                                SizedBox(width: 15),
                                Text(isSwitched ? 'Light Theme' : 'Dark Theme',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: lightGreen,
                                  activeColor: green,
                                ),
                              )
                            ]),
                      ),
                      Divider(height: 1),
                    ]),
              ),
              Flexible(
                  flex: 1,
                  child: Row(children: [
                    SizedBox(width: 20),
                    Icon(Icons.exit_to_app, size: 23, color: Colors.black),
                    SizedBox(width: 15),
                    InkWell(
                        child: Text('Sign Out',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        onTap: () {
                          signOut();
                          Navigator.of(context).pushNamed(AppRoutes.authLogin);
                        }),
                  ]))
            ],
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
