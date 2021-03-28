import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 55,
      backgroundColor: green,
      centerTitle: true,
      title: Text('Chats', 
      style: TextStyle(
        fontSize: 19, 
        color: white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'
        )),
    ));
  }
}
