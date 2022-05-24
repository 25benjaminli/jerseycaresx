import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nav.dart';
import 'dart:io';
import '/colorclass.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( children: [
        Text("Sign Up", style: TextStyle(fontSize: 30)),
        ElevatedButton(child: Text("Already signed up? Go back, sign in with a different account. "), onPressed: () {
          Navigator.pop(context);
        }),

        Text("I would Like to sign up as a..."),

        ElevatedButton(child: Text("Organization"), onPressed: () {

        }),

        ElevatedButton(child: Text("Volunteer"), onPressed: () {

        })


        
      ],
    ));
  }
}