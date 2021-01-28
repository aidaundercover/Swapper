import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/welcome/weltwo.dart';
import 'package:swapper/welcome/welthree.dart';

class WelcomeOne extends StatelessWidget {
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore etd olore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.18,
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                  BoxShadow(
                  color: Color.fromRGBO(239,255,230, 1.0),
                  blurRadius: 3,
                  offset: Offset(-8,-6),
                  spreadRadius: 12,
                ),
                BoxShadow(
                  color: Color.fromRGBO(209,246,193, 1.0),
                  blurRadius: 6,
                  offset: Offset(8,6), 
                  spreadRadius: 12
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 55,
                  child: Container(
                    color: Colors.white,
                    child: Image(
                      image: AssetImage(''),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Expanded(
                  flex: 45,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: <Widget>[
                        Text('Swap clothes online',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mint)),
                        SizedBox(height:10),        
                        Text(
                          description,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12 ,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex:20,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8,0,8,0),
                              child: Row(
                                children: [
                                Container(
                                  width:7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: lightGreen
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                                Container(
                                  width:7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: lightGreen
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                                Container(
                                  width:7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: lightGreen
                                  ),
                                  alignment: Alignment.topCenter,
                                )
                              ],)
                            )
                          ),
                          Expanded(
                            flex:20,
                            child:Container()
                          ),
                          Expanded(
                            flex:23,
                            child:Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width:50,
                                color: greenWhite,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:Icon(
                                  Icons.arrow_forward,
                                  color: white,
                                  size: 30,
                                )
                              ),
                            )
                          ),
                        ],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
