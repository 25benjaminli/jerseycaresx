import 'package:flutter/material.dart';
import 'nav.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(),
    );
  }
}