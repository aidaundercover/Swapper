import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/add_item/forms/add_stuff.dart';
import 'package:swapper/views/add_item/forms/add_swap_event.dart';


class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'PUBLISH SOMETHING!',
            style:TextStyle(
              color: Color.fromRGBO(94, 163, 109, 1.0),
              fontSize: 27,
              fontWeight: FontWeight.bold, 
              fontFamily: 'Arial'
            )
          ),
          SizedBox(
            height:15
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddStuff()));
              },
                child: Container(
                width: MediaQuery.of(context).size.width / 1.25,
                height: 198,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(246, 255, 240, 1.0),
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
                  image: DecorationImage(
                    image: AssetImage("assets/images/bc1ai.png"),
                      fit: BoxFit.fill,
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text("Add Stuff",
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold
                  )
                  )
                ],)
              ),
            ),
          ),
          SizedBox(
            height:20
          ),
          Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddSwapEvent()));
                },
                child:  Container(
                width: MediaQuery.of(context).size.width / 1.25,
                height: 198,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(246, 255, 240, 1.0),
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
                  image: DecorationImage(
                    image: AssetImage("assets/images/bc2ai.png"),
                      fit: BoxFit.fill,
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text("Add ",
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold
                  )
                  )
                ],)
              ),
            ),
          ),
        ]
      ),
    );
  }
}
