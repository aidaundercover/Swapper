import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

class SwitchSwap extends StatefulWidget {
  @override
  _SwitchSwapState createState() => _SwitchSwapState();
}

class _SwitchSwapState extends State<SwitchSwap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
        body: SingleChildScrollView(
      child: Column(
        children: [
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
                      onPressed: () {}),
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
              Container(
                width: MediaQuery.of(context).size.width / 1.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width/1.15,
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        border: Border.all(
                          color: green,
                          width: 1
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 13, 0, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Make a good deed!',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize:17,
                                    fontWeight: FontWeight.bold,
                                    color: green
                                  )
                                ),
                                Image(
                                  image: AssetImage('assets/images/makedeed.png'),
                                  width: 22,
                                  height: 22
                                )
                              ],
                            ),
                          ),
                            Text( 
                              'Would you like to give your things to the charity and make good karma?',
                              style: TextStyle(
                                color: Color.fromRGBO(112, 112, 112,1.0),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Arial',
                              )
                            ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Learn more',
                                  style: TextStyle(
                                    color: green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Arial',
                              )
                                )
                              )
                            ],
                          )
                          
                      ],)
                    )
                  ],
                )
              )
        ],
      ),
    ));
  }
}
