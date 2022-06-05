import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jerseycaresapp/pages/posts.dart';
import '../colorClass.dart';
import 'posts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List l = [];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  Future<List> getNames() async {
    List<DocumentSnapshot> templist;
    List<Map<String, dynamic>> list = [];
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Users");
    QuerySnapshot collectionSnapshot =
        await collectionRef.get(); // <--- This method is now get().

    templist = collectionSnapshot.docs; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data() as Map<String, dynamic>; // <--- Typecast this.
    }).toList();

    List b = [];
    for (var x in list) {
      b.add(x['email']);
    }
    l = b;
    print("LIST: ");

    print(list);

    print("l after");
    print(l);
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getNames(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          // while data is loading:
          print("loading");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print("loaded");

          // data loaded:
          final androidDeviceInfo = snapshot.data;
          return Container(
              // alignment: Alignment.center,

              child: Column(children: <Widget>[
            GFSearchBar(
              searchList: l,
              overlaySearchListItemBuilder: (dynamic item) => Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              searchQueryBuilder: (query, l) => l.where((item) {
                // print("hilo");

                return item
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }).toList(),
            )
          ]));
        }
      },
    ));
  }
}
