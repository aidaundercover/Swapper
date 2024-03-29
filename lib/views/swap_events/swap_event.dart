import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/models/swap_event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:swapper/widgets/drawer.dart';
import 'package:swapper/loadingtohome.dart';
import 'package:swapper/views/swap_events/swap_event_one.dart';

class SwapEvents extends StatefulWidget {
  @override
  _SwapEventsState createState() => _SwapEventsState();
}

class _SwapEventsState extends State<SwapEvents> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address address;
  bool isVisible = true;
  List<SwapEvent> _events = events;
  ScrollController _controller = new ScrollController();
  String locationAdminArea;
  String locationCountry;
  String leftspots;

  @override
  void initState() {
    super.initState();

    getCurrentLocation();
  }

  getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    Position lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);

    setState(() {
      final coordinates = Coordinates(position.latitude, position.longitude);
      convertCoordinatesToAddress(coordinates).then((value) => address = value);

      
        locationAddress = "${address.adminArea.noSuchMethod}, " + "${address.countryName.noSuchMethod}";
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 60,
          titleSpacing: 0,
          centerTitle: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 25, color: gray),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.23,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: white,
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: green, size: 25),
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
              ),
            ],
          )),
      drawer: DrawerCustom(),
      backgroundColor: greenWhite,
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Visibility(
          visible: isVisible,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width / 1.12,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 1, color: green),
                    color: white),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_city_outlined,
                                color: green, size: 28),
                            Text("$locationAddress",
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(112, 112, 112, 1.0)))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
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
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = false;
                                });
                              },
                              child: Container(
                                width: 97,
                                height: 23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green),
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
              SizedBox(height: 20)
            ],
          ),
        ),
        Column(
          children: <Widget>[
            ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
              shrinkWrap: true,
              children: _events.isEmpty
                  ? Text('No more Swap Events')
                  : _events.map(_buildItem).toList(),
            ),
          ],
        ),
      ])),
    );
  }

  Widget _buildItem(SwapEvent event) {
    final eventIndex = _events.indexOf(event);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MoreInfoEvent()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 1.12,
            height: 156,
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
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
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
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 92,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: AssetImage(
                                      '${_events[eventIndex].imageURL}'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                Row(children: [
                                  Text('Left spots:',
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 10,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      events[eventIndex].registered
                                          ? '${_events[eventIndex].people - 1}'
                                          : '${_events[eventIndex].people}',
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 10,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.normal)),
                                ]),
                                InkWell(
                                    child: Text('Check out full info',
                                        style: TextStyle(
                                          color: gray,
                                          fontSize: 10,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                        )),
                                    onTap: () {}),
                                SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 106,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                  color: events[eventIndex]
                                                          .registered
                                                      ? lightGreen
                                                      : green,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: TextButton(
                                                onPressed: () {
                                                  events[eventIndex]
                                                          .registered =
                                                      !events[eventIndex]
                                                          .registered;
                                                },
                                                child: Center(
                                                  child: Text(
                                                      events[eventIndex]
                                                              .registered
                                                          ? 'Registered'
                                                          : 'Register',
                                                      style: TextStyle(
                                                          color:
                                                              events[eventIndex]
                                                                      .registered
                                                                  ? green
                                                                  : white,
                                                          fontFamily: 'Arial',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              )),
                                        ]),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_alarm_outlined,
                                            size: 27, color: green))
                                  ],
                                )
                              ])
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
