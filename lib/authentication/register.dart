import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swapper/home.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email, _password, name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'Registration',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Open Sans'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Image(
                image: AssetImage('assets/images/register.png'),
                width: 270,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,0,5),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black
                        ),
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Пожалуйста введите свое имя';
                          }
                        },
                        onSaved: (input) => name = input,
                        decoration: InputDecoration(
                            hintText: 'Name',
                            contentPadding: const EdgeInsets.fromLTRB(15,15,0,15),
                            filled: false,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,0,5),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black
                        ),
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Please enter your email';
                          }
                        },
                        onSaved: (input) => _email = input,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding: const EdgeInsets.fromLTRB(15,15,0,15),
                          filled: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,0,5),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black
                        ),
                        validator: (input) {
                          if(input.length<6){
                            return 'Password should contain at least 6 characters';
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                          hintText: 'Пароль',
                          contentPadding: const EdgeInsets.fromLTRB(15,15,0,15),
                          filled: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  RaisedButton(
                    onPressed: signUp,
                    child: Text(
                      'Registration',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    color: Colors.lightBlue[400],
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        UserCredential  user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch(e) {
        print(e.message);
      }
    }
  }
}
