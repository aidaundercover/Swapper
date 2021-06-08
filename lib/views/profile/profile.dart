import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/widgets/drawer.dart';
import 'package:swapper/models/mystuff.dart';
import 'package:swapper/models/swap_stuff.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<UserStuff> _stuff = [];
  int itemLength = 0;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _stuff = myStuff;
      itemLength = myStuff.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: greenWhite,
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 46,
          title: Text(
            'PROFILE',
            style: TextStyle(
                color: green,
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, size: 25, color: green),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search, size: 25, color: green),
                onPressed: () {}),
          ],
        ),
        drawer: DrawerCustom(),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 136,
              color: lightGreen,
              child: Center(
                child: Icon(Icons.person, color: white, size: 100),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 215,
              color: white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 139,
                    child: Column(
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('$name',
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Arial')
                                ),
                                Text('$locationAddress',
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Arial')
                                )
                            ],
                          ),
                          Container(
                            width: 96,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                  'CONTACT',
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: 'Arial',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        'Hi! My name is '+ '$name'+', I’m a creative geek from' +'$locationAddress' + 
                        '\nContact me at ' + '$emailAdress',
                        style: TextStyle(
                          color: green,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Arial'
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width/1.1261,
                child: Column(
                  children: [
                    Text(
                      'ITEMS',
                    style: TextStyle(
                          color: green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial'
                        ),
                    ),
                    SizedBox(height: 20,), ])),
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
                      )
                  ]),
              );
            }),
          ),
                    )
          ],
        )));
  }
}
