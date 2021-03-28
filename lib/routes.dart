import 'package:flutter/material.dart';
import 'package:swapper/authentication/signin.dart';
import 'package:swapper/authentication/signup.dart';
import 'package:swapper/views/home.dart';
import 'package:swapper/authentication/forget/forgotpassword.dart';
import 'package:swapper/views/welcome/welone.dart';
import 'package:swapper/loadingtohome.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String authSignup = '/auth-signup';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';
  static const String welcome = '/welcome';
  static const String loading = '/';


  static Map<String, WidgetBuilder> define() {
    return {
      loading: (context) => Loading(),
      authLogin: (context) => LoginPage(),
      authSignup: (context) => SignUp(),
      home: (context) => Home(),
      forgotPassword: (context) => ForgotPassword(),
      welcome: (context) => WelcomeOne(),
    };
  }
}
