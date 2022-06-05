// shortcut things for firebase

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void insert(String collection, Map<String, dynamic> data) async {
  FirebaseFirestore.instance.collection(collection).add(data);
}

void update(String collection, String id, Map<String, dynamic> data) async {
  FirebaseFirestore.instance.collection(collection).doc(id).update(data);
}

void delete(String collection, String id) async {
  FirebaseFirestore.instance.collection(collection).doc(id).delete();
}

Future<Map<String, dynamic>> getById(String collection, String id) async {
  await FirebaseFirestore.instance
      .collection(collection)
      .doc(id)
      .get()
      .then((value) {
    return value.data()!;
  });

  return {};
}

Future<List> getAll(String collection) async {
  await FirebaseFirestore.instance.collection(collection).get().then((value) {
    return value.docs.map((e) => e.data()).toList();
  });

  return [];
}
