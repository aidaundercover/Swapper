import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/swap_events/swap_event.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class Charity extends StatefulWidget {
  @override
  _CharityState createState() => _CharityState();
}

class _CharityState extends State<Charity> {

  GoogleMapController mapController;

  String searchAddr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 59,
        backgroundColor: greenWhite,
        title: Text(
          'Charities',
          style: TextStyle(
            color: green, 
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial'
          ),
        ),
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, 
                size: 25, color: green),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SwapEvents()));},
          ),
      ),),
      body: Stack(
        children: [
          GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition:  CameraPosition(
                  target: LatLng(40.7128, -74.0060), zoom: 10.0),
        ),
        Positioned(
          top: 30.0,
          right: 15.0,
          left: 15.0,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchandNavigate,
                      iconSize: 30.0)),
              onChanged: (val) {
                setState(() {
                  searchAddr = val;
                });
              },
            ),
          ),
        )
        ],
      ),
    );
  }
  searchandNavigate() {
    locationFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10,
      )));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
