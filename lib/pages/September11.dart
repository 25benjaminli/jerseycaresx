import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import '../colorClass.dart';

class September11 extends StatelessWidget {
  const September11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ // <-
          Text("I love September 11"),
          Container(
          margin: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: Align(alignment: Alignment.topLeft, child: ElevatedButton(
            child: Icon(CupertinoIcons.back, color: Colors.white),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(teal.withOpacity(1))),
            onPressed: () { 
              Navigator.pop(context);
            }
          )))
        ]
      )
    );
  }
}