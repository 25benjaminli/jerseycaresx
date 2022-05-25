import 'package:flutter/material.dart';
import '/colorClass.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  _launchShop() async {
    const url = 'https://www.jerseycaresstore.org/';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  _launchChange() async {
    const url = 'https://jerseycares.harnessapp.com/wv2/donate';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  _launchWebsite() async {
    const url = 'https://www.jerseycares.org/';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                height: 107,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blueC,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: [
                  Text(
                    "DONATE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: blueC,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                  Text(
                    "Help Jersey Cares Be the Change, Always",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: tealC,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ]),
              ),
              const SizedBox(height: 30),
              const Text(
                "JERSEY CARES STORE",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Looking for an alternative way to support Jersey Cares? Choose from a variety of t-shirts, hats, and other "swag" products at the Jersey Cares online store.',
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  child: Text(
                    'Start Shopping!',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    _launchShop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: orangeC,
                  )),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/store.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "#CHANGE4CHANGE ROUND UP PROGRAM:",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "1. Register to receive text messages about all things Jersey Cares by texting 'Jersey' to 26989",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "2. Do good while you shop by donating spare change every time you make a purchase using your credit card ",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "3. Invite your friends to sign up and receive FREE Jersey Cares Swag",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "4. Stay connected to watch your spare change create BIG change in New Jersey!",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  child: Text(
                    'More Info',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    _launchChange();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: orangeC,
                  )),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/coins.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "DONATE BY MAIL:",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Please send a check made payable to 'Jersey Cares' to: Jersey Cares, Attn: Brian Dean, 290 West Mount Pleasant Ave. Suite #1320, Livingston, NJ 07039, (973) 533-1993",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/mail.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "MATCHING GIFTS",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Contact your company's human resources department to see if your donation can be matched.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/gift.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "DOLLARS FOR DOERS",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Turn Your Service Hours Into Corporate Dollars for Jersey Cares! Many companies give grants to nonprofits as a reward for their employees' exceptional level of volunteerism in the community. Does your company have a Volunteer Incentive Program? Contact your Human Resources Department to check out your eligibility for the program.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/dollarfordoer.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "UNITED WAY DESIGNATION",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Designate your United Way gift to Jersey Cares.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/unitedway.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "TRIBUTE GIFT",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Make a donation in the name of a friend or relative or in honor of a friend or relative.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/tribute.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "CORPORATE GIVING",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Jersey Cares offers many opportunities for corporations to strengthen New Jersey by supporting Jersey Cares. Please visit our Corporate Partnership section for an overview of opportunities or contact Michelle Dee at (973) 533-1993.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/corporategiving.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "JERSEY CARES FUNDRAISING EVENTS",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Explore our website for more information about future fundraising events.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  child: Text(
                    'Visit Our Website',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    _launchWebsite();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: orangeC,
                  )),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/fundraising.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
            ])));
  }
}
