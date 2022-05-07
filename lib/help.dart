import 'package:flutter/material.dart';
class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Help.",
              style: TextStyle(fontSize: 30),
            ),
          ]
          
        )
      ),
    );
  }
}