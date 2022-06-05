import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../colorClass.dart';

class MessagesPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Row(children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, elevation: 0),
                    icon: ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Image.network(
                          (doc.data() as dynamic)['photoURL'],
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    label: Text((doc.data() as dynamic)['displayName'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15)),
                  )
                ]);
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
