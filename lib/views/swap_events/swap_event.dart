import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/models/swap_event.dart';
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
    return Scaffold(
        backgroundColor: greenWhite,
        body : RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 500));
          setState(() {});
          return;
        },
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: 20),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              size: 30,
                              color: Color.fromRGBO(34, 31, 31, 1.0),
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            }),
                      ),
                      Expanded(
                          flex: 10,
                          child: Container(
                            color: white,
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.search,
                                            color: green, size: 23),
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
                      border: Border.all(width: 1, color: green),
                      color: white
                      ),
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
                                  height: 23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("No, I'm in...",
                                          style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: white)),
                                    ],
                                  ),
                                ),
                                
                              ),
                              SizedBox(width: 15),
                              FlatButton(
                                onPressed: () {
                                  isVisible = false;
                                },
                                child: Container(
                                  width: 97,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("That's right",
                                          style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: white)),
                                    ],
                                  ),
                                ),
                              ),
                            ])
                      ]),
                ),
              )),
          SizedBox(height: 20),
          Column(
            children: [
              ListView(
                shrinkWrap: true,
                          children: _events.isEmpty
                              ? Text('No more Swap Events')
                              : _events.map(_buildItem).toList(),
                        ),
            ],
          ),
        ])),
      ),
    );
  }

  Widget _buildItem(SwapEvent event) {
    final eventIndex = _events.indexOf(event);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.12,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            offset: Offset(3, 4),
                            blurRadius: 7)
                      ]),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),    
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${_events[eventIndex].title}',
                              style: TextStyle(
                                  color: green,
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              height: 92,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: AssetImage('${_events[eventIndex].imageURL}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text('Date',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold)),
                                    Text('${_events[eventIndex].date}',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.normal)),
                                  ]),
                                  Row(children: [
                                    Text('Items for swaps:',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold)),
                                    Text('${_events[eventIndex].stuff}',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.normal)),
                                  ]),
                                  Row(children: [
                                    Text('Amount of people:',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold)),
                                    Text('${_events[eventIndex].people}',
                                        style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.normal)),
                                  ]),
                                  SizedBox(height: 3),
                                  InkWell(
                                    child: Text(
                                      'Check out full info',
                                      style: TextStyle(
                                            color: gray,
                                            fontSize: 10,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                            decoration: TextDecoration.underline,
                                            )),
                                      onTap : () {}
                                    ),
                                  SizedBox(height: 7),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FlatButton(
                                        onPressed: () {},
                                        child: Container(
                                          width: 106,
                                          height: 27,
                                          decoration: BoxDecoration(
                                            color: green,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Register',
                                                style: TextStyle(
                                                  color: white,
                                                  fontFamily: 'Arial',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold
                                                )
                                              )
                                            ],
                                          ),
                                        )
                                      ),
                                      IconButton(
                                        onPressed : () {},
                                        icon: Icon(
                                          Icons.add_alarm_outlined,
                                          size: 27,
                                          color: green
                                          )
                                      )
                                    ],
                                  )
                                ])
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
        SizedBox(height: 15)
      ],
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
