import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




// final msgs = FirebaseFirestore.instance
//   .collection('message')
//   .withConverter<Message>(
//     fromFirestore: (snapshots, _) => Message.fromJson(snapshots.data()!),
//     toFirestore: (message, _) => message.toJson
//   )