import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

bool favorites = false;

class MoreInfoEvent extends StatefulWidget {
  @override
  _MoreInfoEventState createState() => _MoreInfoEventState();
}

class _MoreInfoEventState extends State<MoreInfoEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Swap event for vintage items!',
            style: TextStyle(
                color: green,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_sharp, color: green, size: 27),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/event1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 23,
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: favorites ? Colors.red : Color.fromRGBO(239, 55, 104, 1.0),
                        ),
                        child: GestureDetector(
                          child: favorites
                              ? Icon(
                                  Icons.favorite,
                                  color: white,
                                  size: 27,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: white,
                                  size: 27,
                                ),
                          onTap: () {
                            setState(() {
                              favorites = !favorites;
                            });
                          },
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
            width: MediaQuery.of(context).size.width,
            color: greenWhite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Description:',
                          style: TextStyle(
                          color: Color.fromRGBO(100, 100, 100, 1.0),
                          fontSize: 15,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold)),
                  ),
                  Text('The event is for true lovers and connoisseurs of vintage. From 17:00 to 21:00, visitors will enjoy a rich program with a buffet, games, performances by famous artists, as well as a show of new vintage trends in 2021. Read more on the website www.gra.kz. Entrance is exclusively masked',
                                              style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.normal)),
                                              SizedBox(height: 4,),
                                      Row(
                                    children: [
                                      Text('Date: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                      Text('09.06.2021',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.normal)),
                                    ]),
SizedBox(height: 4,),                                    Row(
                                    children: [
                                      Text('Address: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                    Text('Nazarbayeva 35',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.normal)),
                                    ],
                                    ),
                                    SizedBox(height: 4,),
                                Row(children: [
                                  Text('Stuff:',
                                      style: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold)),
                                  Text('vintage clothes',
                                      style: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.normal)),
              ],),
              SizedBox(height: 4,),
                                Row(children: [
                                  Text('Amount of people:',
                                      style: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold)),
                                  Text('100',
                                      style: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.normal)),
              ],),
                                    ]),
            ),
          ),
        
            Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Organizator',
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1.0),
                  fontSize: 18,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold)
                ),
            ),
              ),
          Container(
            width: MediaQuery.of(context).size.width,
            color:green,
            child: Container(
              height: 117,
              width: MediaQuery.of(context).size.width/ 1.18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person,size: 33,color: darkGreen,),
                    backgroundColor: white,
                    radius: 40,
                  ),
                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Arman Shakamanov',
                            style: TextStyle(
                            color:  white,
                            fontSize: 18,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold)),
                      ),
                                    Text('see all Asem’s swaps',
                                        style: TextStyle(
                                            color: white,
                                            decoration: TextDecoration.underline,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 17,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.normal)),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Location',
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1.0),
                  fontSize: 18,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold)
                ),
            ),
              ),
              Container(
                color: greenWhite,
            width: MediaQuery.of(context).size.width,
            child:Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_searching_outlined,
                    size: 43,
                    color: green),
                    Column(children: [
                      Text(
                'Almaty, Kazakhstan',
                style: TextStyle(
                  color: green,
                  fontSize: 17,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.normal)),
                Text(
                'checkout full info',
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1.0),
                  fontSize: 10,
                  fontFamily: 'Arial',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                  ),
                ),
                    ],),
                  Container(
                    width: MediaQuery.of(context).size.width/2.64,
                    height: 77,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/map.png')),
                      border: Border.all(
                        color: green,
                        width: 2
                      )
                    ),
                  ),
                  ]
                )
              ),
            )
          ),
        
          SizedBox(height: 50,)
            ],
          ),
        ));
  }
}
