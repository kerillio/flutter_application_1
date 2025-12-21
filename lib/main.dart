import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.amber,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/cards': (context) => Home(),
    },
  ));
}

