import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/widgets/drawer.dart';

class SettingsMainPage extends StatefulWidget {
  @override
  _SettingsMainPageState createState() => _SettingsMainPageState();
}

class _SettingsMainPageState extends State<SettingsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0.0,
        backgroundColor: greenWhite,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.33,
              child: Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: green
                )
              ),
            ),
            IconButton(
              icon:Icon(
                Icons.search,
                size: 20, 
                color: green
              ),
              onPressed: () {}
            )
          ],
        ),
        leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 25, color: gray),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 136,
              child: Container(
                color: lightGreen, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 68,
                      color: green
                    )
                  ],
                ),
              )
            ),
            Container(
              height: 106,
              color: greenWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Amira Artykbaeva',
                        style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                          color:green,
                          fontFamily: 'Arial'
                        )
                      ),
                      SizedBox(height:2),
                      Text(
                        "California, USA",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color:green,
                          fontFamily: 'Arial'
                        )
                      )
                  ],),
                  Container(
                    width: 96,
                    height: 40,
                    color: green,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "EDIT",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color:white,
                          fontFamily: 'Arial'
                        )
                      ),
                    ))
                ],
                ),
            ),
            SizedBox(height: 30),
            ListView(
              children:<Widget>[
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings_applications,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'General',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock_rounded,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'Privacy',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                ),
                ListTile(
                  leading: Icon(
                    Icons.block,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'Block',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                ),
                ListTile(
                  leading: Icon(
                    Icons.help_outline_rounded,
                    size: 23, 
                    color: green
                  ),
                  title: Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:white,
                      fontFamily: 'Arial'
                    )
                  ),
                  onTap: () {}
                )
              ]
            )
        ],)
      )
    );
  }
}
