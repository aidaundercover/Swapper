import 'package:swapper/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swapper/home.dart';
import 'package:swapper/const.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 80,
          ),
    
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/auth.png'),
              width: 250,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Пожалуйста введите электронную почту';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          hintText: 'Электронная почта',
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          filled: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                      validator: (input) {
                        if (input.length < 6) {
                          return 'Пароль должен состоять из минимум 6 знаков';
                        }
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                          hintText: 'Пароль',
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          filled: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Еще нет аккаунта?',
                        style: TextStyle(
                            fontFamily: 'Alegreya Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      InkWell(
                        child: Text(
                          'Зарегестрируйтесь',
                          style: TextStyle(
                              fontFamily: 'Alegreya Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: signIn,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Alegreya Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: primaryColor,
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
