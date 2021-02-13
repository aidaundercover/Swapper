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
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddStuff()));
            },
              child: Container(
              color: green
            ),
          ),
          SizedBox(
            height:10
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddSwapEvent()));
              },
              child: Container(
              color: green
            ),
          ),
        ]
      ),
    );
  }
}
