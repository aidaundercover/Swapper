import 'dart:js';

import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/swap_events/swap_event.dart';

var wd;
bool favorites=false;

class MoreInfoEvent extends StatefulWidget {
  @override
  _MoreInfoEventState createState() => _MoreInfoEventState();
}

class _MoreInfoEventState extends State<MoreInfoEvent> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    wd = width;
    return buildEvent();
  }
}

Widget buildEvent() {
  return Scaffold(
    backgroundColor: greenWhite,
    appBar: AppBar(
      toolbarHeight: 65,
      backgroundColor: white,
      title: Text(
        'title',
        style: TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1.0),
            fontFamily: 'Arial',
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            size: 24,
            color: Color.fromRGBO(100, 100, 100, 1.0),
          ),
          onPressed: () => SwapEvents()),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
                width: wd,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('imageUrl')))),
            Positioned(
              right: 30,
              bottom: -23,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(239, 55, 104, 1.0),
                ),
                child: favorites?Icon(
                  Icons.favorite,
                  color: white,
                  size: 27,
                  ) : Icon(Icons.favorite_border,
                  color: white,
                  size: 27,),
              ),
            )
          ]),
          SizedBox(height:10),
          Container(
            width: wd,
            color: white,
            child: Padding(
              padding: const EdgeInse,
              child: Column(children: [
                 Text('Description',
                            style: TextStyle(
                          color: gray,
                                              fontSize: 10,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
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
                                  Text('${_events[eventIndex].people}',
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 10,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.normal)),
              ],),
            ),
          )
        ],
      ),
    ),
  );
}
