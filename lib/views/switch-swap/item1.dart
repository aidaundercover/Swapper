import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/chat/emptypersonalchat.dart';

import '../../routes.dart';

bool favorites = false;

class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: Text(
            'Fendi T-shirt',
            style: TextStyle(
                color: white,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_sharp, color: white, size: 27),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.swich);
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
                            image: AssetImage('assets/images/fendi.png'),
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
                  Text('Was worn only twice, aproximately new, size is  Medium, were bought in USA,orignal. In perfect state, bought it to my husband, but it doesnt fit',
                                              style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.normal)),
                                              SizedBox(height: 4,),
                                      Row(
                                    children: [
                                      Text('Category: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                      Text('Fashion',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                    ]),
SizedBox(height: 4,),                                    Row(
                                    children: [
                                      Text('Preferef swaps: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(100, 100, 100, 1.0),
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                    Text('Fashion,',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                              Text('Hobby,',
                                          style: TextStyle(
                                              color: Colors.yellow[900],
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                            Text('Home&Garden',
                                          style: TextStyle(
                                              color: Colors.green[500],
                                              fontSize: 15,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                    SizedBox(height: 4,),
                                Row(children: [
                                  Text('Location:',
                                      style: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold)),
                                  Text(' Pavlodar,Kazakhstan',
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
            padding: EdgeInsets.all(20),
            child: TextButton(
              child: Container(
                color: green,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 15, 100,15),
                      child: Text(
                        'Deal in chat',
                        style: TextStyle(
                          color: white,
                          fontFamily: 'Arial',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 35,
                        color: white
                      )
                  ],
                ),
              ),
              onPressed: () {
                  Navigator.push(
            context,
                MaterialPageRoute(
                builder: (context) => EmptylChat()));
              },
            ),
            ),
            Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Owner',
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
                        child: Text('Asem Tulebayeva',
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
