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

List l = [];
List names = [];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Future<List> getData() async {
    List asdf = await fb.getAll("Users");
    l = asdf.map((e) => [e['displayName'], e['email'], e['uid']]).toList();
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
              overlaySearchListItemBuilder: (dynamic item) => Container(
                padding: const EdgeInsets.all(8),
                child: Row(children: [
                  Text(
                    "${item[0]}",
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(item[0] + " " + item[1] + " " + item[2]);
                      },
                      child: Text("Msg"))
                ]),
              ),
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
