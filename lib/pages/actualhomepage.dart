import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jerseycaresapp/pages/posts.dart';
import '../colorClass.dart';
import 'posts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ActualHomepage extends StatelessWidget {
  const ActualHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("Welcome to the Homepage"),
            Container(
            margin: const EdgeInsets.only(top: 1.0, right: 15.0),
            child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    child: Icon(Icons.add, color: Colors.white),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            teal.withOpacity(1))),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostsPage(
                              // user: user,
                              ),
                        ),
                      );
                    }))),
        ElevatedButton(
            child: Icon(Icons.delete),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("PostTest")
                  .get()
                  .then((snapshot) async {
                for (DocumentSnapshot ds in snapshot.docs) {
                  await ds.reference.delete();
                }
              });
              FirebaseFirestore.instance.collection("PostTest").doc().set({
                // "title": "Bruh",
                "uid": FirebaseAuth.instance.currentUser!.uid.toString(),
                "caption": "Bruh Caption",
                "profileURL": FirebaseAuth.instance.currentUser!.photoURL,
                "postPhotoURL": "null",
                // "number": f.toString(),
              });

              // Fire
              // delete all posts but leave one
              // FirebaseFirestore.instance.collection
            }),
            Expanded(
              flex: 20,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('PostTest').snapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot
                ) { 
                  if (!snapshot.hasData) return const SizedBox.shrink(); 
                      return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final docDataA = (snapshot.data!.docs[index].data());
                        final docData = docDataA! as Map<String, dynamic>;
                        print("docdata " + index.toString());
                        print(docData);
                        // final title = (docData['title']); 
                        final caption = (docData['caption']);
                        final photoURL = (docData['profileURL']); 
                        final postURL = (docData['postPhotoURL']);
                        var username;
                        print("lol");
                        // grab username from firestore
                        // FirebaseFirestore.instance.collection("Users").doc(docData['uid']).snapshots().listen((snapshot) {
                        //   username = snapshot.data()!['displayName'];
                        // });
                        print("Hihihii");
                        // String s = FirebaseAuth.instance.currentUser.photoURL;
                        // print(username);
                        return Column(
                          children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // need to align the text & image properly
                                Image(
                                  image: NetworkImage(photoURL),
                                  width: 35, 
                                  height: 35,
                                ),
                                Text("            " + FirebaseAuth.instance.currentUser!.displayName!)
                              ]
                            ),
                            Image.file(
                              File(postURL),
                              width: 300,
                              height: 300,
                              alignment: Alignment.center,
                            ),

                            Text(caption),
                            const SizedBox(height: 30),






                            
                            // Align(
                            //   child: 
                            //     ClipRRect(
                            //     borderRadius: BorderRadius.circular(50),
                            //     child: Row(
                            //       children: [ 
                            //         Image(
                            //       image: NetworkImage(
                            //       photoURL),
                            //       width: 35,
                            //       height: 35,
                            //     ),
                            //     ListTile(
                            //       title: Text(title),
                            //       subtitle: Text(caption)
                            //     ),
                                
                            //     ]
                            //       ),
                            //     ), 
                              
                            // )
                          ]                        

                        // trailing: FirebaseAuth.instance.currentUser != null ? Image.network(FirebaseAuth.instance.currentUser!.profileURL) : ,
                        );
                  },
                );
              }),
        ),
      ]),
    ));
  }
}
