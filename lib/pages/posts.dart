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
  int? msgNum;

  // final  = TextEditingController();
  Future<void> uploadFile(
    String? filepath,
    String filename,
  ) async {
    String folderName = FirebaseAuth.instance.currentUser!.uid;

    File f = File(filepath!);
    try {
      await FirebaseStorage.instance.ref('/$filename').putFile(f);
    } catch (e) {
      print(e);
    }
  }

  String? path;
  String fileName = "";
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('PostTest')
        .snapshots()
        .listen((event) {
      msgNum = event.docs.length;
    });
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
              label: Text("Post - Caption"),
            ),
            controller: Caption),
        // do file thing
        SizedBox(
          height: 20.0,
        ),

        ElevatedButton(
            child: Text("upload file"),
            onPressed: () async {
              print("message num: " + msgNum.toString());

              final res = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg']);
              if (res == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No File Selected")));
              }
              // make a folder per user
              String uid = FirebaseAuth.instance.currentUser!.uid;
              path = (res!.files.single.path)!;
              String orig = res.files.single.name;
              fileName = msgNum.toString() + "-" + uid; // message id, user id.
            }),

        Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () async {
                  await uploadFile(path, fileName);

                  // GET NUMBER
                  final fileStorage = FirebaseStorage.instance;
                  final storage = FirebaseFirestore.instance;
                  // var num;
                  // try {
                  //   num = await storage.collection("PostTest").snapshots();
                  // } catch(e) {
                  //   print("errorrlol");
                  //   print(e);
                  // }
                  // print("num: " + num.toString());
                  String url = await fileStorage
                      .ref()
                      .child(msgNum.toString() +
                          "-" +
                          FirebaseAuth.instance.currentUser!.uid.toString())
                      .getDownloadURL();

                  FirebaseFirestore.instance.collection("PostTest").doc().set({
                    // "title": Title.text,
                    "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                    "caption": Caption.text,
                    "profileURL": FirebaseAuth.instance.currentUser!.photoURL,
                    "postPhotoURL": url,
                    "displayName": FirebaseAuth
                        .instance.currentUser!.displayName
                        .toString(),
                    "msgid": msgNum.toString(),
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
        // Center(
        //   child: GestureDetector(
        //     onTap: () {
        //       _showPicker(context);
        //     },
        //     child: CircleAvatar(
        //       radius: 55,
        //       backgroundColor: Color(0xffFDCF09),
        //       child: _photo != null
        //           ? ClipRRect(
        //               borderRadius: BorderRadius.circular(50),
        //               child: Image.file(
        //                 _photo!,
        //                 width: 100,
        //                 height: 100,
        //                 fit: BoxFit.fitHeight,
        //               ),
        //             )
        //           : Container(
        //               decoration: BoxDecoration(
        //                   color: Colors.grey[200],
        //                   borderRadius: BorderRadius.circular(50)),
        //               width: 100,
        //               height: 100,
        //               child: Icon(
        //                 Icons.camera_alt,
        //                 color: Colors.grey[800],
        //               ),
        //             ),
        //     ),
        //   ),
        // )
      ],
    ));
  }
}
