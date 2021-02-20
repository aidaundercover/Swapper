import 'package:swapper/routes.dart';
import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/net/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.authSignup);
                },
                color: Color.fromRGBO(169, 241, 185, 1.0),
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 48,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Sign Up',
                        style: TextStyle(
                          color: green,
                          fontFamily: 'Arial',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
      appBar: AppBar(
        backgroundColor: greenWhite,
        toolbarHeight: 1,
      ),
      backgroundColor: greenWhite,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text('WELCOME BACK',
                  style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 40),
              Container(
                  color: white,
                  width: 330,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',
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
                                    controller: emailRecover.toString().isEmpty ? emailControllerSignIn : emailRecover,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    onSaved: (input) =>
                                        emailRecover.toString().isEmpty ? emailControllerSignIn.text = input : emailRecover.text= input,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please enter you e-mail';
                                      }
                                    },
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
                                    controller: passwordControllerSignIn,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                    },
                                    onSaved: (input) =>
                                        passwordControllerSignIn.text = input,
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
                            ],
                          )),
                    ],
                  )),
              SizedBox(height: 20),
              Ink(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
                  },
                  child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
              ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 328,
                height: 48,
                child: FlatButton(
                  color: green,
                  onPressed:signIn,
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    child: Image(
                      image: AssetImage('assets/images/google.png'),
                      width: 17,
                      height: 17,
                    ),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  ),
                  OutlineButton(
                    child: Image(
                      image: AssetImage('assets/images/twitter.png'),
                      width: 17,
                      height: 17,
                    ),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  ),
                  OutlineButton(
                    child: Image(
                      image: AssetImage('assets/images/facebook.png'),
                      width: 17,
                      height: 17,
                    ),
                    borderSide: BorderSide(color: lightGreen, width: 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(height: 20),
              Text("Don't have an account yet?",
                  style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
              
            ]),
      ),
    );
  }

  Future<void> signIn() async {
  final formState = _formKey.currentState;
  if (formState.validate()) {
    formState.save();
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: emailControllerSignIn.text, password: passwordControllerSignIn.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('displayName', user.user.displayName);
      Navigator.of(context).pushNamed(AppRoutes.home);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for the email');
      }
    } catch (e) {
      print(e.message);
    }
  }
}
}
