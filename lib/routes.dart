import 'package:flutter/material.dart';
import 'package:swapper/bloc/authentication/signin.dart';
import 'package:swapper/bloc/authentication/signup.dart';
import 'package:swapper/views/home.dart';
import 'package:swapper/bloc/authentication/forget/forgotpassword.dart';
import 'package:swapper/views/switch-swap/switch_swap.dart';
import 'package:swapper/views/welcome/welone.dart';
import 'package:swapper/loadingtohome.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-signin';
  static const String authSignup = '/auth-signup';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';
  static const String welcome = '/welcome';
  static const String swich = '/switch';


  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => LoginPage(),
      authSignup: (context) => SignUp(),
      home: (context) => Home(),
      swich: (context) =>SwitchSwap(),
      forgotPassword: (context) => ForgotPassword(),
      welcome: (context) => WelcomeOne(),
    };
  }
}
