import 'package:flutter/material.dart';
import 'package:swapper/authentication/signin.dart';
import 'package:swapper/authentication/signup.dart';
import 'package:swapper/views/home.dart';
import 'package:swapper/authentication/forgotpassword.dart';
import 'package:swapper/welcome/welone.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String authSignup = '/auth-signup';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => LoginPage(),
      authSignup: (context) => SignUp(),
      home: (context) => Home(),
      forgotPassword: (context) => ForgotPassword(),
      welcome: (context) => WelcomeOne(),
    };
  }
}
