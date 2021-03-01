import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/switch-swap/tinder_switch.dart';
import 'package:swapper/models/swap_stuff.dart';

class SwitchSwap extends StatefulWidget {
  @override
  _SwitchSwapState createState() => _SwitchSwapState();
}

class _SwitchSwapState extends State<SwitchSwap> {
  bool isVisible = true;
  ScrollController _controller = new ScrollController();
  List<UserStuff> _stuff = dummyStuff;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: greenWhite,
        drawer: Drawer(
            child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        )),
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
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
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
              Container(
                  width: MediaQuery.of(context).size.width / 1.13,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        height: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(color: green, width: 1)),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 13, 0, 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
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
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Text('Learn more',
                                            style: TextStyle(
                                                color: green,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Arial',
                                                decoration:
                                                    TextDecoration.underline)))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 15),
              Visibility(
                visible: isVisible,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    height: 166,
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
                        SizedBox(height: 5),
                        Container(
                          width: 115,
                          height: 31,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: green),
                          child: FlatButton(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('TRY',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial',
                                      )),
                                ],
                              ),
                              onPressed: () {
                                isVisible = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TinderStuff()));
                              }),
                        ),
                        SizedBox(height: 20)
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: _controller,
                        shrinkWrap: true,
                        children: _stuff.isEmpty
                            ? Text('No more Swaps')
                            : _stuff.map(_buildItemOne).toList(),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: <Widget>[
                      ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: _controller,
                        shrinkWrap: true,
                        children: _stuff.isEmpty
                            ? Text('No more Swaps')
                            : _stuff.map(_buildItemTwo).toList(),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildItemOne(UserStuff stuff) {
    final stuffIndex = _stuff.indexOf(stuff);

    return Column(children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width / 2.343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white
            ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.343,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage('${_stuff[stuffIndex].imgUrl}'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10,10,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${_stuff[stuffIndex].title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${_stuff[stuffIndex].location}',
                      
                    )
                  ]
                )
              )
            ],
          )),
      SizedBox(height: 12)
    ]);
  }

  Widget _buildItemTwo(UserStuff stuff) {
    final stuffIndex = _stuff.indexOf(stuff);
  }
}
