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
import 'others_info_screen.dart';

List l = [];
List names = [];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Future<List> getData() async {
    l = await fb.getAll("Users"); // list<map>
    // for (dynamic i in asdf) {
    //   if (i['uid'] != FirebaseAuth.instance.currentUser!.uid){ l.add([i['displayName'], i['email'], i['uid']]); }
    // }
    // l = asdf.map((e) {
    //   return [
    //     e['displayName'],
    //     e['email'],
    //     e['uid'],
    //     e['photoURL'],
    //     e['about']
    //   ];
    // }).toList();
    names = l.map((e) => (e['displayName'])).toList();
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
                return (item["uid"] as String) !=
                        FirebaseAuth.instance.currentUser!.uid
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(children: [
                          // Text(
                          //   "${item[0]}",
                          //   style: const TextStyle(
                          //       fontSize: 13, color: Colors.black),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10),
                          // ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white, elevation: 0),
                              onPressed: () {
                                print(item);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OthersInfoScreen(info: item)));

                                // fb.update("Users",
                                //     FirebaseAuth.instance.currentUser!.uid, {
                                //   "outgoingFollowRequests":
                                //       FieldValue.arrayUnion([item["uid"]])
                                // });

                                // fb.update("Users", item["uid"], {
                                //   "incomingFollowRequests":
                                //       FieldValue.arrayUnion([
                                //     FirebaseAuth.instance.currentUser!.uid
                                //   ])
                                // });
                              },
                              child: Row(children: [
                                ClipOval(
                                  child: Material(
                                    color: CustomColors.firebaseGrey
                                        .withOpacity(0.3),
                                    child: (Image.network(item["photoURL"],
                                        height: 50, width: 50)),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text("${item["displayName"]}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    )),
                              ]))
                        ]),
                      )
                    : Container();
              },
              searchQueryBuilder: (query, l) => l.where((item) {
                // print("hilo");
                item = item as Map;
                return ((item["displayName"] as String)
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
