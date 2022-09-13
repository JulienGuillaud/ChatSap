import 'package:chat_sap/screens/welcome/welcome_screen.dart';
import 'package:chat_sap/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // TEST YANO
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatSap',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: WelcomeScreen(),
    );
  }
}
