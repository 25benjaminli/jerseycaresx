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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ABOUT US",
                style: GoogleFonts.quicksand(fontSize: 15),
              ),
              Image.asset(
                'assets/images/ourteam.jpeg',
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Our Vision",
                style: TextStyle(fontSize: 25, color: blueC),
                textAlign: TextAlign.center,
              ),
              Text(
                "We envision a New Jersey in which everyone is motivated and empowered to make a positive difference.",
                style: GoogleFonts.quicksand(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "Our Mission",
                style: TextStyle(fontSize: 25, color: blueC),
                textAlign: TextAlign.center,
              ),
              Text(
                "As a leader in volunteerism in New Jersey, Jersey Cares increases the level of meaningful volunteer engagement by creating and managing efficient, impactful projects that address critical community-identified needs.",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(fontSize: 15),
              ),
              const SizedBox(height: 30),
              const Text(
                "Opportunities Youth Engagement",
                style: TextStyle(fontSize: 25, color: blueC),
                textAlign: TextAlign.center,
              ),
              Text(
                "Jersey Cares strategically identifies initiatives that use community engagement and volunteer service to support low-and-moderate income young adults develop the skills they need to prepare for college and careers.",
                style: GoogleFonts.quicksand(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "History",
                style: TextStyle(fontSize: 25, color: blueC),
                textAlign: TextAlign.center,
              ),
              Text(
                "Jersey Cares, a nonprofit organization, established in 1993, recruits and engages volunteers in rewarding, effective efforts that address community-identified needs. We partner with local nonprofits to identify needs and implement volunteer projects to meet these needs.",
                style: GoogleFonts.quicksand(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Text(
                "We provide individuals, families, corporate employees and community groups with a wide variety of volunteer opportunities that range from tutoring children to painting new murals in schools. Jersey Cares is an affiliate of the Points of Light network, an innovative alliance of volunteer catalysts throughout the world.",
                style: GoogleFonts.quicksand(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "VOLUNTEER TODAY!",
                style: TextStyle(fontSize: 25, color: blueC),
                textAlign: TextAlign.center,
              ),
              Text(
                "Volunteering with Jersey Cares is easy; once you have registered, choose from hundreds of opportunities in our Volunteer Opportunity Calendar, participate in an Annual Event, run a Collection Drive or get your company involved in our Corporate Service Program.",
                style: GoogleFonts.quicksand(fontSize: 15),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
