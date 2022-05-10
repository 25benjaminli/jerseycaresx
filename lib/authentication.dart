import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/pages/user_info_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static var googleAccount = Rx<GoogleSignInAccount?>(null);

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore f = FirebaseFirestore.instance;
    User? user;
    print("a");
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);
        user = userCredential.user;
        print(user);
      } catch (e) {
        print(e);
      }
    } else {
      print("b");
      final GoogleSignIn googleSignIn = GoogleSignIn();
      print("c");

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      googleAccount.value = googleSignInAccount;
      print("d");

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // print("e");
        // print(user);
        // print(user!.displayName.toString());
        // print(auth.currentUser!.email.toString());
        // print(user.photoURL.toString());
        // print(user.uid.toString());
        // print("f");

        






        // sign in with credential, set the current user to this one.
        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
          CollectionReference users = f.collection("Users"); 
          var docref = f.collection("Users").doc(auth.currentUser!.uid.toString());
          var doc = await docref.get();
          
          if (!doc.exists){
            f.collection("Users").doc(auth.currentUser!.uid.toString()).set({
            "displayName": auth.currentUser!.displayName,
            "email": auth.currentUser!.email,
            "photoURL": auth.currentUser!.photoURL,
            "uid": auth.currentUser!.uid.toString()
            });
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}
