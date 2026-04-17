import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(CureConnectApp());
}

class CureConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CureConnect',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF008080),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(), 
    );
  }
}
