import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swapper/routes.dart';
import 'package:swapper/const.dart';
import 'package:swapper/net/firebase.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();
  bool _obscureText = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenWhite,
          title: Text(
            'SWAPPER',
            style: TextStyle(
              color: green,
              fontFamily: 'Arial',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_backspace_rounded,
                  color: green, size: 22),
              onPressed: () {},
            );
          }),
          centerTitle: true,
        ),
        backgroundColor: greenWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                  color: white,
                  width: 330,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Create an Account',
                          style: TextStyle(
                            color: green,
                            fontFamily: 'Arial',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 32),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 290,
                                child: TextFormField(
                                  controller: _username,
                                  style: TextStyle(
                                    color: green,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                  },
                                  onSaved: (input) => _username.text = input,
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                        color: lightGreen,
                                        fontFamily: 'Arial',
                                        fontSize: 14
                                        ),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: lightGreen),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: lightGreen ,width:2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: _email,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please enter you e-mail';
                                      }
                                    },
                                    onSaved: (input) => _email.text = input,
                                    decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                        color: lightGreen,
                                        fontFamily: 'Arial',
                                        fontSize: 14
                                        ),
                                      filled: false,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: lightGreen),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: lightGreen,width:2),
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: _password,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please enter new password';
                                      } else if (input.length < 8) {
                                        return 'Password should contain at least 8 characters';
                                      }
                                    },
                                    onSaved: (input) => _password.text = input,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 19),
                                        color:
                                            Color.fromRGBO(168, 168, 168, 1.0),
                                        onPressed: _toggle,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: lightGreen,
                                        fontFamily: 'Arial',
                                        fontSize: 14
                                        ),
                                      filled: false,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: lightGreen),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: lightGreen,width:2),
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                  )),
                              SizedBox(height: 18),
                              Container(
                                width: 290,
                                child: TextFormField(
                                  controller: _repassword,
                                  style: TextStyle(
                                    color: green,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please confirm your password by reentering it';
                                    } else if (input != _password.text) {
                                      return 'Password must be the same as above';
                                    }
                                  },
                                  onSaved: (input) => _repassword.text = input,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 19),
                                      color: Color.fromRGBO(168, 168, 168, 1.0),
                                      onPressed: _toggle,
                                    ),
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
                                        color: lightGreen,
                                        fontFamily: 'Arial',
                                        fontSize: 14
                                        ),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: lightGreen),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: lightGreen,width:2),
                                    ),
                                    
                                  ),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 25),
                      Center(
                          child: Ink(
                        child: Text(
                          'By creating an account you agree to our\nTerms of Service and Privacy Policy',
                          style: TextStyle(
                            color: green,
                            fontFamily: 'Arial',
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                width: 328,
                height: 48,
                child: FlatButton(
                  color: green,
                  onPressed: signUp,
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    child: Icon(Icons.face, color: green, size: 16),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  ),
                  OutlineButton(
                    child: Icon(Icons.face, color: green, size: 16),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  ),
                  OutlineButton(
                    child: Icon(Icons.face, color: green, size: 16),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(height: 20),
              Text("Already have an account?",
                  style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.authLogin);
                },
                color: Color.fromRGBO(169, 241, 185, 1.0),
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 48,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Login',
                        style: TextStyle(
                          color: green,
                          fontFamily: 'Arial',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email.text, password: _password.text);
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: _username.text);
        userSetup(_username.text);
        Navigator.of(context).pushNamed(AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print('The account already exists for that email');
        }
      } catch (e) {
        print(e.message);
      }
    }
  }
}
