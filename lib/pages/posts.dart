import 'package:flutter/material.dart';
import 'nav.dart';
import '/colorclass.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore.instance.collection("Posts").doc().set({
//                 "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
//                 "caption": FirebaseAuth.instance.currentUser!.displayName.toString(),
//                 "caption": FirebaseAuth.instance.currentUser!.uid.toString(),
//               });

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final Caption = TextEditingController();
  final Title = TextEditingController();
  // final  = TextEditingController();
  String imageUrl = '';
  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        TextField(
            decoration: InputDecoration(
              label: Text("Post - Title"),
            ),
            controller: Title),
        TextField(
            decoration: InputDecoration(
              label: Text("Post - Caption"),
            ),
            controller: Caption),
        // do file thing
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: Text("Upload Image",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          elevation: 5.0,
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          splashColor: Colors.grey,
        ),

        Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () {
                  FirebaseFirestore.instance.collection("Posts").doc().set({
                    "title": Title.text,
                    "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                    "caption": Caption.text,
                    "photoURL":
                        FirebaseAuth.instance.currentUser!.photoURL.toString(),
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NavBar(
                          // user: user,
                          ),
                    ),
                  );
                },
                label: Text("post")))
      ],
    ));
  }
}
