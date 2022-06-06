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
import '../fbasefunctions.dart' as fb;

class OthersInfoScreen extends StatefulWidget {
  final Map _info;

  const OthersInfoScreen({Key? key, required Map info})
      : _info = info,
        super(key: key);

  @override
  _OthersInfoScreenState createState() => _OthersInfoScreenState(_info);
}

class _OthersInfoScreenState extends State<OthersInfoScreen> {
  final Map _info;

  /*
  "displayName": item[0],
    "email": item[1],
    "uid": item[2],
    "photoURL": item[3],
    "about": item[4]
   */
  _OthersInfoScreenState(info) : _info = info;

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

  // void asdf() async {
  //   info = await fb.getById("Users", _uid);
  // }

  @override
  void initState() {
    // asdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 15.0, right: 15.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          child:
                              Icon(CupertinoIcons.pencil, color: Colors.white),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  teal.withOpacity(1))),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditSettingsPage(
                                    // user: user,
                                    ),
                              ),
                            );
                          }))),
              Row(),
              _info['photoURL'] != null
                  ? ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Image.network(
                          _info['photoURL']!,
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
                _info['displayName']!,
                style: const TextStyle(
                  color: tealC,
                  fontSize: 26,
                ),
              ),
              Text("Followers: ",
                  style: const TextStyle(color: Colors.black, fontSize: 26)),
              const SizedBox(height: 16.0),

              // future builder for displaying the "about" information

              Text(_info['about'] ?? "",
                  style: const TextStyle(color: Colors.black, fontSize: 26)),

              ElevatedButton(
                child: Text("go back"),
                onPressed: () {
                  Navigator.pop(context);
                },
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
            ],
          ),
        ));
  }
}
