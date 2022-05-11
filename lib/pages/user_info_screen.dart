import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'package:jerseycaresapp/colorClass.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import '/authentication.dart';
import 'nav.dart';
import 'editsettings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:class_to_map/class_to_map.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User? user})
      : _user = user,
        super(key: key);

  final User? _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser!;
    

    super.initState();
  }

  Future<DocumentSnapshot> getAboutMe() async {
    DocumentSnapshot user = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid.toString()).get();

    return user;
    
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
            top: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
              const SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: const TextStyle(
                  color: tealC,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                _user.email!,
                style: const TextStyle(
                  color: orangeC,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16.0),
              // future builder for displaying the "about" information
              
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Users').where(
                  "uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()
                  ).snapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot
                ) { 
                  if (!snapshot.hasData) return const SizedBox.shrink(); 
                      
                      final docDataA = (snapshot.data!.docs[0].data());
                      print("docdata: " + docDataA.toString());
                      final docData = docDataA! as Map<String, dynamic>;
                      print("docdata2: " + docData['about'].toString());
                      final about = (docData['about']).toString(); 
                      
                      return Text('${about}', style: TextStyle(color: Colors.black));
                  }
              ),
              const Spacer(),
              _isSigningOut
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      icon: Icon(CupertinoIcons.arrow_uturn_left_circle_fill,
                          color: Colors.black),
                      label: Text("sign out",
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton.icon(onPressed: () => {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => EditSettingsPage(
                            // user: user,
                          ),
                        ),
                      )
                    }, icon: Icon(Icons.create_sharp), label: Text("edit account settings"))
            ],
          ),
        ),
      ),
    );
  }
}
