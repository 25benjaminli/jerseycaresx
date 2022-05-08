import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'pages/nav.dart';
import 'pages/homepage.dart';
import '/colorClass.dart';
import 'pages/sign_in_screen.dart';

void main() {
  // init firebase HERE
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jersey Cares',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: teal,
      ),
      home: SignInScreen(),
    );
  }
}
