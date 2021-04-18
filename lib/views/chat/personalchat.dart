import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/views/chat/chat_list.dart';

class PersonalChat extends StatefulWidget {
  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      appBar: AppBar(
        title: Text(
          'AIGANYM TEGISOVE',
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
              Navigator.pop(context);
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
      body: SingleChildScrollView(
        
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topLeft),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: greenSlight,
          ),
          padding: EdgeInsets.all(16),
          child: Text('Hi! I really liked your Louis Vitton PJs', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topRight),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: green,
          ),
          padding: EdgeInsets.all(16),
          child: Text('Yeah, I bought it in Milan actually', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topLeft),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: greenSlight,
          ),
          padding: EdgeInsets.all(16),
          child: Text('Thats so cool, how much did it cost? (if it is not a secret)', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topLeft),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: greenSlight,
          ),
          padding: EdgeInsets.all(16),
          child: Text('Btw, what is the material?', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topRight),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: green,
          ),
          
          padding: EdgeInsets.all(16),
          child: Text('It costed 2450 euro back then', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topLeft),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: greenSlight,
          ),
          
          padding: EdgeInsets.all(16),
          child: Text('Wow', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topRight),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: green,
          ),
          
          padding: EdgeInsets.all(16),
          child: Text('It is 100% cotton but some people sya that they add poliester too', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topLeft),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: greenSlight,
          ),
          
          padding: EdgeInsets.all(16),
          child: Text('Did you like something from mine?', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topRight),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: green,
          ),
          padding: EdgeInsets.all(16),
          child: Text('I dont know yet', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            ),
            Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                alignment: (Alignment.topRight),
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: green,
          ),
          padding: EdgeInsets.all(16),
          child: Text('So, are you interested?', 
          style: TextStyle(
            fontSize: 14,
            color: white,
            fontFamily: 'Arial'
          ),),
        ),
      ),
            )
            
          ],)),
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
    );
  }
}
