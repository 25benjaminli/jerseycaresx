import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colorClass.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 77,
                width: 310,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blueC,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: [
                  Text(
                    "HELP",
                    style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: blueC,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                  Text(
                    "Frequently Asked Questions",
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
                "HOW DO I REGISTER TO VOLUNTEER?",
                style: TextStyle(
                  fontSize: 20,
                  color: orangeC,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Registering is easy! Simply click on the \"Login\" button on top of the screen. If you are already a member, type in your username and password. If you are new, click on the \"Not a Member? Register\" link and fill in the necessary information. Once you are done, click \"submit\" and start searching for projects.",
                style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "HOW CAN I GET MY COMPANY INVOLVED WITH JERSEY CARES?",
                style: TextStyle(
                  fontSize: 20,
                  color: orangeC,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "If you are interested in getting your company involved with Jersey Cares, complete the Corporate Service Inquiry Form here. ",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              ),
              const SizedBox(height: 30),
              const Text(
                "HOW CAN I BECOME A PARTNER AGENCY?",
                style: TextStyle(
                  fontSize: 20,
                  color: orangeC,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "If you are interested in becoming a Partner Agency, register here and call us at (973) 533-1993.",
                style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "HOW CAN I FIND PROJECTS THAT ARE APPROPRIATE FOR FAMILIES/CHILDREN?",
                style: TextStyle(
                  fontSize: 20,
                  color: orangeC,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "To find a family friendly project or projects suitable for children, select the \"Appropriate for\" filter on the left hand side of the \"Find an Opportunity\" page. Make sure to select the correct age group to find appropriate projects.",
                style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "HOW CAN I BECOME A VOLUNTEER LEADER - PROJECT COORDINATOR?",
                style: TextStyle(
                  fontSize: 20,
                  color: orangeC,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "To become a Project Coordinator (PC) you will need to be a Jersey Cares volunteer who has participated in at least 2 projects on the monthly calendar within the past year, complete an application which can be downloaded here, attend an interview and a training which includes learning how to use the Jersey Cares website and the administrative website. For more information visit the Project Coordinator Page or contact us at (973) 533-1993.",
                style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
