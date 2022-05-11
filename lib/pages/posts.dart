import 'package:flutter/material.dart';
import 'nav.dart';
import '/colorclass.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 40),
        TextField(decoration: InputDecoration(
          label: Text("Post - Title"),
          
        ),),
        TextField(decoration: InputDecoration(
          label: Text("Post - Caption"),
          
        ), controller: Caption),
        // do file thing
        TextField(decoration: InputDecoration(
          label: Text("Post - Photo"),
          
        ),
        ),

        Align(
           alignment: Alignment.center, 
           child: ElevatedButton.icon(icon: Icon(Icons.save), onPressed: () {
              
              
              FirebaseFirestore.instance.collection("Posts").doc().set({
                "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                "caption": Caption.text,
                "photoURL": FirebaseAuth.instance.currentUser!.photoURL.toString(),
                // "title": FirebaseAuth.instance.currentUser!.title.toString(),
              });
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => NavBar(
                  // user: user,
                ),
              ),
              );
           }, 
           label: Text("post")  
          
        )
        )],)
    );
  }
}