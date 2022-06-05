import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

List list = [
  "ben",
  "pragun",
  "neel",
  "shreyas",
];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // alignment: Alignment.center,

            child: Column(children: <Widget>[
      GFSearchBar(
        searchList: list,
        overlaySearchListItemBuilder: (dynamic item) => Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            item,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        searchQueryBuilder: (query, list) => list.where((item) {
          return item!.toString().toLowerCase().contains(query.toLowerCase());
        }).toList(),
      )
    ])));
  }
}
