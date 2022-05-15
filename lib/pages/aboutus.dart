import 'package:flutter/material.dart';
import '/colorClass.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blueC,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: [
                  Text(
                    "ABOUT US",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: blueC,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                  Text(
                    "Who is Jersey Cares?",
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
                "VISION",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "We envision a New Jersey in which everyone is motivated and empowered to make a positive difference.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/vision.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "MISSION",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "As a leader in volunteerism in New Jersey, Jersey Cares increases the level of meaningful volunteer engagement by creating and managing efficient, impactful projects that address critical community-identified needs.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/mission.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "OPPORTUNITY YOUTH ENGAGEMENT",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Jersey Cares strategically identifies initiatives that use community engagement and volunteer service to support low-and-moderate income young adults develop the skills they need to prepare for college and careers.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/youthengagement.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "HISTORY",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Jersey Cares, a nonprofit organization, established in 1993, recruits and engages volunteers in rewarding, effective efforts that address community-identified needs. We partner with local nonprofits to identify needs and implement volunteer projects to meet these needs.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "We provide individuals, families, corporate employees and community groups with a wide variety of volunteer opportunities that range from tutoring children to painting new murals in schools. Jersey Cares is an affiliate of the Points of Light network, an innovative alliance of volunteer catalysts throughout the world.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/history.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                "VOLUNTEER TODAY!",
                style: TextStyle(
                    fontSize: 20,
                    color: orangeC,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Volunteering with Jersey Cares is easy; once you have registered, choose from hundreds of opportunities in our Volunteer Opportunity Calendar, participate in an Annual Event, run a Collection Drive or get your company involved in our Corporate Service Program.",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: blackC, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/volunteertoday.png',
                height: 200,
                width: 200,
              ),
            ])));
  }
}
