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

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  bool _obscureText = true;

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
                                  controller: _usernameController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                  },
                                  onSaved: (input) => _usernameController.text = input,
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
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: _emailController,
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
                                    onSaved: (input) => _emailController.text = input,
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
                                      errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    ),
                                  )),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: _passwordController,
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
                                    onSaved: (input) => _passwordController.text = input,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,                                           size: 19),
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
                                      errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    ),
                                    obscureText: _obscureText,
                                  )),
                              SizedBox(height: 18),
                              Container(
                                width: 290,
                                child: TextFormField(
                                  controller: _repasswordController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please confirm your password by reentering it';
                                    } else if (input != _passwordController.text) {
                                      return 'Password must be the same as above';
                                    }
                                  },
                                  onSaved: (input) => _repasswordController.text = input,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
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
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red[600], width: 2)
                                    ),
                                  ),
                                  obscureText: _obscureText,
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
                email: _emailController.text, password: _passwordController.text);
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: _usernameController.text);
        userSetup(_usernameController.text);
        Navigator.of(context).pushNamed(AppRoutes.welcome);
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
