import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/src/swap_event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class SwapEvents extends StatefulWidget {
  @override
  _SwapEventsState createState() => _SwapEventsState();
}

class _SwapEventsState extends State<SwapEvents> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;
  bool isVisible = true;
  List<SwapEvent> _events = events;

  @override
  void initState() {
    super.initState();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.medium, distanceFilter: 100);
    _streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        print(position);
        _position = position;

        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => _address = value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
        return;
      },
      child: SingleChildScrollView(
          child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 25,
                      color: Color.fromRGBO(34, 31, 31, 1.0),
                    ),
                    onPressed: () {}),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon:
                                    Icon(Icons.search, color: green, size: 21),
                                onPressed: () {}),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: green),
                                borderRadius: BorderRadius.circular(7)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: green),
                                borderRadius: BorderRadius.circular(7)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: green),
                                borderRadius: BorderRadius.circular(7)),
                            hintText: 'Search for swap-events',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1.0),
                                fontFamily: 'Arial',
                                fontSize: 13))),
                  ))
            ]),
        Padding(
            padding: EdgeInsets.all(20),
            child: Visibility(
                visible: isVisible,
                child: Container(
                width: MediaQuery.of(context).size.width / 1.12,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 1, color: green)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Looks like you are here',
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green)),
                      Row(children: <Widget>[
                        Icon(Icons.location_city_outlined,
                            color: green, size: 28),
                        Text("${_address?.addressLine ?? '-'}",
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(112, 112, 112, 1.0)))
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Container(
                                width: 97,
                                height: 21,
                                child: Text("No, I'm in...",
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: white)),
                              ),
                              color: green,
                              splashColor: lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(width: 17),
                            FlatButton(
                              onPressed: () {
                                isVisible = false;
                              },
                              child: Container(
                                width: 97,
                                height: 21,
                                child: Text("That's right",
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: white)),
                              ),
                              color: green,
                              splashColor: lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ])
                    ]),
              ),
            )),
        SizedBox(height: 28),
        ListView(
          children: _events.map(_buildItem).toList(),
        )
      ])),
    );
  }

  Widget _buildItem(SwapEvent swap) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
        child: Container(
            color: white,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(3, 4),
                      blurRadius: 7)
                ]),
            width: MediaQuery.of(context).size.width / 1.12,
            height: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('k'),
                Row(
                  children: [Image(image: null), Column(children: [])],
                )
              ],
            )));
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
