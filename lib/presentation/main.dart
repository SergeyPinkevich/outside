import 'package:flutter/material.dart';
import 'package:outside/presentation/search.dart';
import 'package:outside/presentation/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outside',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          button: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          caption: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(155, 155, 155, 1.0),
          ),
        ),
      ),
      home: SearchPage(),
    );
  }
}
