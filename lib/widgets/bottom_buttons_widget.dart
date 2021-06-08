import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

class BottomButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0,0,0, 0.16),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]
            ),
            child: Icon(Icons.dangerous ,size:36, 
            color: Colors.black 
            ),
          ),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0,0,0, 0.16),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]
            ),
            child: Icon(Icons.favorite_outlined ,size:36, 
            color: Colors.redAccent ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0,0,0, 0.16),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]
            ),
            child: Icon(Icons.chat, size:36, 
            color: Colors.blueAccent)
          ),
        ],
      );
}
