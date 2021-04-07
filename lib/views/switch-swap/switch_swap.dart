import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/switch-swap/tinder_switch.dart';
import 'package:swapper/models/swap_stuff.dart';
import 'package:swapper/widgets/drawer.dart';
import 'dart:async';



class SwitchSwap extends StatefulWidget {
  @override
  _SwitchSwapState createState() => _SwitchSwapState();
}

class _SwitchSwapState extends State<SwitchSwap> {
  bool isVisible = true;
  List<UserStuff> _stuff = [];
  int itemLength = 0;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _stuff = dummyStuff;
      itemLength = dummyStuff.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: greenWhite,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 60,
            titleSpacing: 0,
            centerTitle: false,
            leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 25, color: gray),
              onPressed: () => Scaffold.of(context).openDrawer()
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
                          hintText: 'Search for stuff',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1.0),
                              fontFamily: 'Arial',
                              fontSize: 13))),
                ),
              ],
            )),
        drawer: DrawerCustom(),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {});
            return;
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                    width: MediaQuery.of(context).size.width / 1.19,
                    height: 105,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: green, width: 1)
                    ),
                    child: Container(
                            width: MediaQuery.of(context).size.width / 1.44,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 13, 0, 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Make a good deed!',
                                            style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: green)),
                                        SizedBox(width: 5),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/makedeed.png'),
                                            width: 24,
                                            height: 24)
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Would you like to give your things to the charity and make good karma?',
                                    style: TextStyle(
                                      color: Color.fromRGBO(112, 112, 112, 1.0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {},
                                          child: Text('Learn more',
                                              style: TextStyle(
                                                  color: green,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Arial',
                                                  decoration: TextDecoration
                                                      .underline)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          
                    )),
                SizedBox(height: 15),
                Container(
                      width: MediaQuery.of(context).size.width / 1.19,
                      height: 159,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          border: Border.all(color: green, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('FIND YOUR PERFECT MATCH',
                              style: TextStyle(
                                color: green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Arial',
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Center(
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore magna aliqua.',
                                  style: TextStyle(
                                    color: green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Arial',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          SizedBox(height: 10),
                          Container(
                            width: 115,
                            height: 31,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: green),
                            child: TextButton(
                                child: Text('TRY',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Arial',
                                        )),
                                        onPressed: () {
                                  isVisible = false;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TinderStuff()));
                                }
                                ),
                                ),
                          SizedBox(height: 20)
                        ],
                      )
                ),
                SizedBox(height: 24,),
                Padding(
          padding: const EdgeInsets.only(left: 10, right:10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(_stuff.length, (index) {
              return Container(
                width: (size.width - 30) / 2,
                height: 250,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: (size.width - 30) / 2,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(('${_stuff[index].imgUrl}')),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: (size.width - 15) / 2,
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.25),
                                    Colors.black.withOpacity(0),
                                  ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                        )
                      ],
                    ),
                    Container(
                      width: (size.width - 15) / 2,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                      ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${_stuff[index].title}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(
                          '${_stuff[index].location}',
                          style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal)
                        ),
                        Text(
                          '14:22',
                          style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal)
                        )
                      ])
                      ),                  ],
                ),
              );
            }),
          ),
        ),
                  SizedBox(height: 50),
                  Text(
                    'No more swaps',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Arial'
                    )
                    ),
                    SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }

  
  
  
}
