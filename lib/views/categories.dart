import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            fontWeight:FontWeight.bold,
            fontFamily: 'Arial'
          )
          ),
        leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.chevron_left_rounded, size: 25, color: Colors.black),
              onPressed: () {},
            ),
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248,242,72, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/child.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Children Stuff',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(114,212,255, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/electr.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Electronics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(97,124,237, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/tshirt.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fashion and Style',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248,174,72, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/basket.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hobbies and Sport',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(146,248,72, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/home.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Home and Garden',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(203,203,203, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/car.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transport',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
          SizedBox(height:19),
          Container(
            width: MediaQuery.of(context).size.width / 1.09,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(227,105,51, 0.7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                  child: ImageIcon(
                    AssetImage('assets/images/building.png'),
                    size: 30,
                    color: Colors.black
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Real Estate',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                      )
                    ),
                    Text(
                      '102094 deals',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        color: Color.fromRGBO(67,67,67, 1.0)
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10,0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/right.png'),
                      size: 17,
                      color: Colors.black
                    ), 
                    onPressed: () {}
                  ),
                )
                  ],
                )
            ],),
          ), 
      ],),
    );
  }
}
