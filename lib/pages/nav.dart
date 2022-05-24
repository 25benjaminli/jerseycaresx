// import 'dart:html';

//import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:jerseycaresapp/pages/September11.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/http.dart';
import '../main.dart';
import 'aboutus.dart';
import 'help.dart';
import 'martinluther.dart';
import 'sponsors.dart';
import 'trackhours.dart';
import '/colorClass.dart';
import 'getInvolved.dart';
import 'annualevents.dart';
import 'actualhomepage.dart';
import 'search.dart';
import 'messagespage.dart';
import 'upcomingevents.dart';
import 'user_info_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  
  

  @override
  State<StatefulWidget> createState() {
    return _NavBar.bottom(0);
  }
}

bool pressedInvolved = false;
bool pressedTrackHours = false;
bool pressedAnnualEvents = false;
bool pressedAboutUs = false;
bool pressedHelp = false;
bool pressedSponsor = false;

bool selectedBottom = true;

_launchURL() async {
  const url = 'https://www.jerseycares.org/Donate';
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    throw 'Could not launch $url';
  }
}

class _NavBar extends State<NavBar> {
  int _selectedIndexHamburger = 0;
  int _selectedIndexBottom = 0;
  bool displayBottom = true;


  _NavBar.hamburger(this._selectedIndexHamburger);
  _NavBar.bottom(this._selectedIndexBottom);


  static const List<Widget> optionsHamburger = <Widget>[
    GetInvolvedPage(),
    // donate
    TrackHoursPage(),
    AnnualEventsPage(),
    AboutUsPage(),
    HelpPage(),
    SponsorsPage(),
  ];

  static List<Widget> optionsBottom = <Widget>[
    ActualHomepage(),
    SearchPage(),
    UpcomingEventsPage(),
    MessagesPage(),
    UserInfoScreen(
      user: FirebaseAuth.instance.currentUser,
    ),
  ];

  void _onItemTappedHamburger(int index) {
    // print(index);
    selectedBottom = false;
    displayBottom = false;
    setState(() {
      _selectedIndexHamburger = index;
    });
  }

  void _onItemTappedBottom(int index) {
    // print(index);
    selectedBottom = true;
    displayBottom = true;
    pressedInvolved = false;
    pressedTrackHours = false;
    pressedAnnualEvents = false;
    pressedAboutUs = false;
    pressedHelp = false;
    pressedSponsor = false;
    setState(() {
      _selectedIndexBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: teal,
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        // ),
      ),

      body: Center(
        child: displayBottom
            ? optionsBottom.elementAt(_selectedIndexBottom)
            : optionsHamburger.elementAt(_selectedIndexHamburger),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              leading:
                  const Icon(CupertinoIcons.heart_circle_fill, color: orangeC),
              title: const Text('Get Involved'),
              tileColor: pressedInvolved ? greyC : null,
              onTap: () {
                pressedInvolved = true;
                pressedAboutUs = false;
                pressedAnnualEvents = false;
                pressedTrackHours = false;
                pressedAboutUs = false;
                pressedHelp = false;
                pressedSponsor = false;
                Navigator.pop(context);
                _onItemTappedHamburger(0);
              },
            ),
            ListTile(
              leading: const Icon(FeatherIcons.creditCard, color: orangeC),
              title: const Text('Donate'),
              onTap: () {
                Navigator.pop(context);
                _launchURL();
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.hourglass, color: orangeC),
              title: const Text('Track Hours'),
              tileColor: pressedTrackHours ? greyC : null,
              onTap: () {
                pressedInvolved = false;
                pressedAboutUs = false;
                pressedAnnualEvents = false;
                pressedTrackHours = true;
                pressedAboutUs = false;
                pressedHelp = false;
                pressedSponsor = false;
                Navigator.pop(context);
                _onItemTappedHamburger(1);
              },
            ),
            ListTile(
              title: const Text('Annual Events'),
              leading: const Icon(FeatherIcons.checkSquare, color: orangeC),
              tileColor: pressedAnnualEvents ? greyC : null,
              onTap: () {
                pressedInvolved = false;
                pressedAboutUs = false;
                pressedAnnualEvents = true;
                pressedTrackHours = false;
                pressedAboutUs = false;
                pressedHelp = false;
                pressedSponsor = false;
                Navigator.pop(context);
                _onItemTappedHamburger(2);
              },
            ),
            ListTile(
              leading: const Icon(FeatherIcons.info, color: orangeC),
              title: const Text('About Us'),
              tileColor: pressedAboutUs ? greyC : null,
              onTap: () {
                pressedInvolved = false;
                pressedAboutUs = true;
                pressedAnnualEvents = false;
                pressedTrackHours = false;
                pressedAboutUs = true;
                pressedHelp = false;
                pressedSponsor = false;
                Navigator.pop(context);
                _onItemTappedHamburger(3);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.question_diamond_fill,
                  color: orangeC),
              tileColor: pressedHelp ? greyC : null,
              title: const Text('Help'),
              onTap: () {
                pressedInvolved = false;
                pressedAboutUs = false;
                pressedAnnualEvents = false;
                pressedTrackHours = false;
                pressedAboutUs = false;
                pressedHelp = true;
                pressedSponsor = false;
                Navigator.pop(context);
                _onItemTappedHamburger(4);
              },
            ),
            ListTile(
              leading: const Icon(FeatherIcons.dollarSign, color: orangeC),
              tileColor: pressedSponsor ? greyC : null,
              title: const Text('Our Sponsors'),
              onTap: () {
                Navigator.pop(context);
                pressedInvolved = false;
                pressedAboutUs = false;
                pressedAnnualEvents = false;
                pressedTrackHours = false;
                pressedAboutUs = false;
                pressedHelp = false;
                pressedSponsor = true;
                _onItemTappedHamburger(5);
              },
            ),
            const Divider(),
            ListTile(
              title: Column(
                children: const [
                  Text('Contact Us:'),
                ],
              ),
              subtitle: Column(
                children: const [
                  Text('info@jerseycares.org'),
                  Text('+1 (973) 533-1993')
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(FeatherIcons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(FeatherIcons.search),
          ),
          BottomNavigationBarItem(
            label: "Upcoming Events",
            icon: Icon(FeatherIcons.calendar),
          ),
          BottomNavigationBarItem(
            label: "Message",
            icon: Icon(FeatherIcons.messageSquare),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(FeatherIcons.user),
          ),
        ],
        currentIndex: _selectedIndexBottom,
        selectedItemColor: selectedBottom ? orange : bottomItemColor,
        onTap: _onItemTappedBottom,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: const Text("click here lol")
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.navigation),
      // ),
    );
  }
}
