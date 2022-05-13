import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jerseycaresapp/colorClass.dart';
import '../main.dart';

class GetInvolvedPage extends StatelessWidget {
  const GetInvolvedPage({Key? key}) : super(key: key);

  _watchBriefVideo() async {
    const url = 'https://www.screencast.com/t/7XfYkrviu';
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
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blueC,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: [
                  Text(
                    "YOUTH WORKFORCE DEVELOPMENT",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: blueC,
                        fontWeight: FontWeight.bold,
                        height: 1.4),
                  ),
                  Text(
                    "Providing NJ Youth with Career Opportunities",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: tealC,
                        fontWeight: FontWeight.bold,
                        height: 1.4),
                  ),
                ]),
              ),
              const SizedBox(height: 30),
              const Text(
                "FELLOWSHIP",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Jersey Cares is committed to closing the opportunity gap in New Jersey. We enhance the professional development of young people and reduce youth unemployment through two key workforce development programs; the Youth Workforce Development Fellowship noted below and our Park Ambassador, Summer Youth Employment Program.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Are you ready to become the next Jersey Cares Fellow?",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "HOW TO APPLY",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "1. Create a volunteer profile at the Jersey Cares website: www.jerseycares.org/volunteer-sign-up",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Complete the Fellowship Application. www.jerseycares.org/fellowship_application (please note, you must be logged into your Jersey Cares account before clicking this link).",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              InkWell(
                child: Text(
                  "Click Here for More Details",
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: blueC,
                      height: 1.4,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onTap: () => _watchBriefVideo(),
              ),
              const SizedBox(height: 10),
              Text(
                "Our nonprofit partners who we serve as the core of our mission, must not discriminate in its staff, board, volunteers, volunteer committees or recipients of services on the basis of a person's race, religion, gender, sexual orientation, age, national origin, ancestry, marital status, veteran status, mental disability, physical disability or any other status prohibited by applicable law.",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "YOUTH WORKFORCE DEVELOPMENT FELLOWSHIP",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "The Youth Workforce Development Fellowship is designed for low-to-moderate income youth of Essex County (age 16-24) and aims to address the disconnect between young adults, workforce development skills, and employment opportunities. The Fellowship creates a unique opportunity for selected Fellows to be a focal point of merging efforts from some of Newark’s major companies as well as its vibrant non-profit sector.",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Our Fellows will serve as stewards and ambassadors of Jersey Cares and will drive social change by leading well-managed, sustainable projects and programs at various non-profit agencies. Not only will their work strengthen and leverage community assets and meet community-identified needs, but their management will be underscored with a series of workforce development training and/or workshops at a Newark company that will include leadership competencies, resume/interviewing skills and culminate with a “Day of Demonstration.”",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Get inspired to help by watching this video of Senator Cory Booker addressing a cohort of Rutgers University Newark students at a Jersey Cares program graduation. Click Here",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "If you're interested in learning more about how to get involved please contact, Tatiana Sava at (973) 533-1993 or tatiana@jerseycares.org.",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "SPONSORSHIP",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Is your foundation, company or group of influential friends ready to invest financial resources into making a direct difference in the lives of young people in Newark?",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "LEADERSHIP",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Are you interested in helping us build and guide this work through your network?",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "SKILLS-BASED VOLUNTEER",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Are you interested in sharing your talent, the talent of your network and/or the talent of your company?",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: blackC,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ])));
  }
}
