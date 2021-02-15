import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/authentication/forget/verificationcode.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 50),
            child: Row(
              children: [Icon(Icons.arrow_back, size: 17, color: green)],
            )),
        Image(image: AssetImage('assets/images/forgot_password_girl.png')),
        Expanded(
            flex: 1,
            child: Column(
              children: [],
            )),
        Expanded(
            flex: 1,
            child: Container(
              width: 270,
              height: 42,
              child: FlatButton(
                  child: Text('CONTINUE'),
                  color: green,
                  textColor: white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerficationCode()));
                  }),
            )),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                    width: 45,
                    height: 6,
                    color: lightGreen,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15))),
                SizedBox(width: 10),
                Container(
                    width: 45,
                    height: 6,
                    color: white,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15))),
                SizedBox(width: 10),
                Container(
                    width: 45,
                    height: 6,
                    color: white,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15))),
                SizedBox(width: 10)
              ],
            ))
      ],
    ));
  }
}
