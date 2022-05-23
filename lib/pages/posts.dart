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
  FirebaseStorage storage = FirebaseStorage.instance;

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
    // if (_photo == null) return;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/assets/files/family.png';
    File file = File(filePath);
    // final filepath = 'assets/files/family.png';
    // final destination = 'file/';
    // print("dest: " + destination);
    // File f = File(filePath);
    try {
      await FirebaseStorage.instance.ref().putFile(file);
      // await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Container(
            margin: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                    child: Icon(CupertinoIcons.back, color: Colors.white),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            teal.withOpacity(1))),
                    onPressed: () {
                      Navigator.pop(context);
                    }))),
        SizedBox(height: 30),
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
        ),
        const SizedBox(height: 30),
        Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () {
                  FirebaseFirestore.instance.collection("PostTest").doc().set({
                    "title": Title.text,
                    "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                    "caption": Caption.text,
                    "profileURL": FirebaseAuth.instance.currentUser!.photoURL,
                    "postPhotoURL": _photo.toString(),
                    // "number": f.toString(),
                  });
                  uploadFile();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavBar(
                        // user: user,
                        ),
                  ));
                },
                label: Text("post"))),
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
