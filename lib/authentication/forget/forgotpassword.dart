import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/authentication/forget/verificationcode.dart';
import 'package:swapper/routes.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenWhite,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 50),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back, size: 20, color: green),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.authLogin);
                      }),
                ],
              )),
          Image(
              image: AssetImage('assets/images/forgot_password_girl.png'),
              width: 284,
              height: 284),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 23),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: green,
                  fontFamily: 'Arial',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter you e-mail';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'exmaple@mail.com',
                  hintStyle: TextStyle(
                      color: lightGreen, fontFamily: 'Arial', fontSize: 15),
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightGreen),
                      borderRadius: BorderRadius.circular(0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreen, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[600], width: 2)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[600], width: 2)),
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: [],
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 48,
                  child: FlatButton(
                    color: green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerficationCode()));
                    },
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: white,
                        fontFamily: 'Arial',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 45,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: lightGreen,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 45,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: white,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 45,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: white,
                      )),
                  SizedBox(width: 10)
                ],
              ))
        ],
      ),
    );
  }
}
