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
import '../fbasefunctions.dart' as fb;
import 'package:firebase_auth/firebase_auth.dart';

List l = [];
List names = [];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Future<List> getData() async {
    List asdf = await fb.getAll("Users");
    // for (dynamic i in asdf) {
    //   if (i['uid'] != FirebaseAuth.instance.currentUser!.uid){ l.add([i['displayName'], i['email'], i['uid']]); }
    // }
    l = asdf.map((e) {
      return [e['displayName'], e['email'], e['uid']];
    }).toList();
    names = asdf.map((e) => (e['displayName'])).toList();
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
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
              overlaySearchListItemBuilder: (dynamic item) {
                return item[2] != FirebaseAuth.instance.currentUser!.uid
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(children: [
                          Text(
                            "${item[0]}",
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                print(item[0] + " " + item[1] + " " + item[2]);
                                fb.update("Users",
                                    FirebaseAuth.instance.currentUser!.uid, {
                                  "outgoingFollowRequests":
                                      FieldValue.arrayUnion([item[2]])
                                });

                                fb.update("Users", item[2], {
                                  "incomingFollowRequests":
                                      FieldValue.arrayUnion([
                                    FirebaseAuth.instance.currentUser!.uid
                                  ])
                                });
                              },
                              icon: Icon(Icons.add),
                              label: Text("Friend"))
                        ]),
                      )
                    : Container();
              },
              searchQueryBuilder: (query, l) => l.where((item) {
                // print("hilo");
                item = item as List;
                return (item[0]
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()));
              }).toList(),
            )
          ]));
        }
      },
    ));
  }
}
