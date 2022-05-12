import 'package:flutter/material.dart';
import 'nav.dart';
import 'dart:io';
import '/colorclass.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
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

        Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () {
                  FirebaseFirestore.instance.collection("Posts").doc().set({
                    "title": Title.text,
                    "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                    "caption": Caption.text,
                    "photoURL": _photo.toString(),
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NavBar(
                          // user: user,
                          ),
                    ),
                  );
                },
                label: Text("post"))),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: _photo != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _photo!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        )
      ],
    ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
