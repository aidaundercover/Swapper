import 'package:flutter/material.dart';
import 'package:swapper/authentication/signin.dart';
import 'package:swapper/authentication/signup.dart';
import 'package:swapper/home.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String authSignup = '/auth-signup';
  static const String home = '/home';

  static Map<String,WidgetBuilder> define(){
    return {
      authLogin: (context) => LoginPage(),
      authSignup: (context) => SignUp(),
      home: (context) => Home(),
    };
  }
}
