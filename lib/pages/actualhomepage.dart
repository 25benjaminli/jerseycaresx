import 'package:flutter/material.dart';
import 'package:jerseycaresapp/pages/posts.dart';
import 'posts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            Expanded(
              flex: 20,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
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
                        final title = (docData['title']); 
                        final caption = (docData['caption']);
                        final photoURL = (docData['photoURL']); 

                        var username;
                        print("lol");
                        // grab username from firestore
                        // FirebaseFirestore.instance.collection("Users").doc(docData['uid']).snapshots().listen((snapshot) {
                        //   username = snapshot.data()!['displayName'];
                        // });
                        print("Hihihii");
                        // String s = FirebaseAuth.instance.currentUser.photoURL;
                        print(username);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ ListTile(
                          title: Text(title),
                          subtitle: Text(caption)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: NetworkImage(
                               photoURL),
                               width: 35,
                               height: 35,
                            ),
                          ), 
                          ]                        

                          // trailing: FirebaseAuth.instance.currentUser != null ? Image.network(FirebaseAuth.instance.currentUser!.photoURL) : ,
                        );
                      },
                    );
                      
                    
                  }
            ),
            ),
          Spacer(),
          Align(alignment: Alignment.bottomCenter, child: FloatingActionButton(onPressed: () { 
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => PostsPage(
                  // user: user,
                ),
              ),
            );
          }, 
          child: Icon(Icons.add), 
          // label: Text("Make A Post"))
          
          ))]),

      )
    );
  }
}