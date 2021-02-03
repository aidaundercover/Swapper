import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/welcome/welthree.dart';

class WelcomeTwo extends StatelessWidget {
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore etd olore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 19.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.18,
                height: MediaQuery.of(context).size.height / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(239,255,230,1.0),
                      blurRadius: 12,
                      offset: Offset(-8, -6),
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                        color: Color.fromRGBO(209, 246, 193, 1.0),
                        blurRadius: 15,
                        offset: Offset(8, 6),
                        spreadRadius: 3),
                  ],
                  color: greenWhite
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 55,
                      child: Container(
                        color: white,
                        child: Image(
                          image: AssetImage('assets/images/weltwo.png'),
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
                            Align(
                            alignment: Alignment.topLeft,
                            child: Text('Arrange and visit swap-parties',
                                  style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: mint,
                                      ),
                                      textAlign: TextAlign.start,
                                      ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              description,
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 20,
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 7,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(228, 228, 228, 1.0)),
                                              alignment: Alignment.topCenter,
                                            ),
                                            SizedBox(width: 4),
                                            Container(
                                              width: 7,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: lightGreen),
                                              alignment: Alignment.topCenter,
                                            ),
                                            SizedBox(width: 4),
                                            Container(
                                              width: 7,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(228, 228, 228, 1.0)),
                                              alignment: Alignment.topCenter,
                                            )
                                          ],
                                        ))),
                                Expanded(flex: 20, child: Container()),
                                Expanded(
                                    flex: 23,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: InkWell(
                                            child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greenWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                color: white,
                                                blurRadius: 12,
                                                offset: Offset(-8, -6),
                                                spreadRadius: 3,
                ),
                BoxShadow(
                    color: Color.fromRGBO(213, 241, 221, 1.0),
                    blurRadius: 12,
                    offset: Offset(8, 6),
                    spreadRadius: 3),
                                              ]
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.arrow_forward,
                                                color: white,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                Navigator.push (
                                                context,
                                                MaterialPageRoute(builder: (context) => WelcomeThree()),
                                              );
                                              },
                                            )),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
        ),
          ),
      ),
    );
  }
}


