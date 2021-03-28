import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:swapper/routes.dart';
import 'package:swapper/const.dart';
import 'package:swapper/net/auth_service.dart';
import 'package:swapper/net/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.authLogin);
          },
          child: Container(
            color: Color.fromRGBO(169, 241, 185, 1.0),
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
        backgroundColor: greenWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25,
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
                                  controller: usernameController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (String input) {
                                    if (input.isEmpty) {
                                      return "Name can't be empty";
                                      }
                                      if (input.length < 2) {
                                          return "Name must be at least 2 characters long";
                                        }
                                        if (input.length > 50) {
                                          return "Name must be less than 50 characters long";
                                        }
                                        return null;
                                  },
                                  onSaved: (input) =>
                                      usernameController.text = input,
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                        color: lightGreen,
                                        fontFamily: 'Arial',
                                        fontSize: 14),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: lightGreen),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightGreen, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red[600], width: 2)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red[600], width: 2)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (String input) {
                                      if (input.isEmpty) {
                                        return 'Please enter you e-mail';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) =>
                                        emailController.text = input,
                                    decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                          color: lightGreen,
                                          fontFamily: 'Arial',
                                          fontSize: 14),
                                      filled: false,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: lightGreen),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: lightGreen, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                    ),
                                  )),
                              SizedBox(height: 18),
                              Container(
                                  width: 290,
                                  child: TextFormField(
                                    controller: passwordController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (String input) {
                                      if (input.isEmpty) {
                                        return 'Please enter new password';
                                      } else if (input.length < 8) {
                                        return 'Password should contain at least 8 characters';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) =>
                                        passwordController.text = input,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            size: 19),
                                        color:
                                            Color.fromRGBO(168, 168, 168, 1.0),
                                        onPressed: _toggle,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: lightGreen,
                                          fontFamily: 'Arial',
                                          fontSize: 14),
                                      filled: false,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: lightGreen),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: lightGreen, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                    ),
                                    obscureText: _obscureText,
                                  )),
                              SizedBox(height: 18),
                              Container(
                                width: 290,
                                child: TextFormField(
                                  controller: repasswordController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (String input) {
                                    if (input.isEmpty) {
                                      return 'Please confirm your password by reentering it';
                                    } else if (input !=
                                        passwordController.text) {
                                      return 'Password must be the same as above';
                                    }
                                    return null;
                                  },
                                  onSaved: (input) =>
                                      repasswordController.text = input,
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
                                        fontSize: 14),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: lightGreen),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightGreen, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red[600], width: 2)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red[600], width: 2)),
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
                color: green,
                width: 328,
                height: 48,
                child: TextButton(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/images/google.png'),
                      width: 17,
                      height: 17,
                    ),
                    style: OutlinedButton.styleFrom(
                    side: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/images/twitter.png'),
                      width: 17,
                      height: 17,
                    ),
                    style: OutlinedButton.styleFrom(
                    side: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Image(
                      image: AssetImage('assets/images/facebook.png'),
                      width: 17,
                      height: 17,
                    ),
                    style: OutlinedButton.styleFrom(
                    side: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    ),
                    onPressed: () {}
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
              SizedBox(height: 20),
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
                email: emailController.text, password: passwordController.text);
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: usernameController.text);
        userSetup(usernameController.text);
        addToCloud();
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
