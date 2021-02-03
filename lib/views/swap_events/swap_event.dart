import 'package:flutter/material.dart';
import 'package:swapper/const.dart';

class SwapEvents extends StatefulWidget {
  @override
  _SwapEventsState createState() => _SwapEventsState();
}

class _SwapEventsState extends State<SwapEvents> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(Row(
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    size: 25,
                    color: Color.fromRGBO(34, 31, 31, 1.0),
                  ),
                  onPressed: () {}),
            ),
            Expanded(
                flex: 10,
                child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                            Icons.search,
                            color:green,
                            size: 21
                            ),
                            onPressed: () {}
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:green),
                          borderRadius: BorderRadius.circular(7)
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:green),
                          borderRadius: BorderRadius.circular(7)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:green),
                          borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: 'Search for swap-events',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(112,112,112),
                          fontFamily: 'Arial',
                          fontSize:13
                        )
                      )
                    )
                  )
                )
              )
            );
  }
}
