import 'package:flutter/material.dart';
import 'package:swapper/routes.dart';
import 'package:swapper/authentication/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapper/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var username = preferences.getString('displayName');
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: username==null ? LoginPage() : Home(),
      routes: AppRoutes.define(),
    ));
}
