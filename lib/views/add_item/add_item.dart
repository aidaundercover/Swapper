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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Choose smth smth',
            style:TextStyle()
          ),
          SizedBox(
            height:10
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddStuff()));
              },
                child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: green
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text("Add Stuff",
                  style:TextStyle(
                    color: white,
                    fontFamily: 'Arial'
                  )
                  )
                ],)
              ),
            ),
          ),
          SizedBox(
            height:10
          ),
          Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddSwapEvent()));
                },
                child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: green
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text("Create Event",
                  style:TextStyle(
                    color: white,
                    fontFamily: 'Arial'
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
