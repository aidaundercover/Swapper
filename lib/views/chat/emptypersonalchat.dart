import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/switch-swap/item1.dart';

class EmptylChat extends StatefulWidget {
  @override
  _EmptylChatState createState() => _EmptylChatState();
}

class _EmptylChatState extends State<EmptylChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      appBar: AppBar(
        title: Text(
          'ASEM TULEBAYEVA',
          style: TextStyle(
            color: green,
            fontSize: 14,
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_outlined, size: 27, color: gray,),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ItemOne()));
            },
          ),
          toolbarHeight: 56,
          backgroundColor: white,
          actions: [
            IconButton(
                icon: Icon(Icons.settings, size: 25, color: green),
                onPressed: () {}),
          ],
      ),
      bottomNavigationBar: Container(
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    'Say something...',
                    style: TextStyle(color: Colors.grey)
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: IconButton(icon: Icon(Icons.send, size: 27, color: green), onPressed: () {}),
                )
            ],)
          ),
      body: SingleChildScrollView(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/1.6,
                child: Text('Make a deal, swap and save environment!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greenSlight,
                )
                ),
              ),
            )
          ]
    )));
  }
}
