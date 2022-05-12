import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colorClass.dart';
import 'September11.dart';
import 'martinluther.dart';


class AnnualEventsPage extends StatelessWidget {
  const AnnualEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ANNUAL EVENTS",
              style: GoogleFonts.quicksand(fontSize: 25, color: blueC),
            ),
            Text(
              "Turn a Day Off Into a Day On",
              style: GoogleFonts.quicksand(
                fontSize: 20,
                color: tealC,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "DR. MARTIN LUTHER KING JR. DAY OF SERVICE",
              style: TextStyle(fontSize: 20, color: orangeC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              "The Jersey Cares Martin Luther King, Jr. Day of Service engages people across the state to embody Dr. King's vision and bring people of all ages and backgrounds together, strengthening their communities and building a stronger New Jersey.",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "In 2022, over 550 volunteers across 6 virutal and 7 in-person opportunities honored Dr. King's legacy in projects designed to aid the refugee community with getting a restful night’s sleep, remind the senior citizen community that they are loved and appreciated, empower communities of color by advocating for social justice, keep economically disadvantaged communities warm through the winter months, and more.",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              "'Everybody can be great, because anybody can serve.' - Dr. Martin Luther King, Jr.",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/martinluther.jpg',
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('More Info'),
              onPressed: () {  
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MartinLutherPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: blueC,
              )
            ),
            const SizedBox(height: 30),
            const Text(
              "SEPTEMBER 11TH NATIONAL DAY OF SERVICE & REMEMBRANCE",
              style: TextStyle(fontSize: 20, color: orangeC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              "In 2021, as part of the national movement to preserve September 11th as a day of service and remembrance, and in honor of the 20th Anniversary, Jersey Cares facilitated volunteer projects for volunteers both virtually and in-person to support communities strongly affected by the events of 9/11. ",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Volunteers honored the day through projects such as creating thank-you cards for first responders, landscaping at a local park, and assembling You Matter Kits for students in the Jersey City community. Through these projects, volunteers worked to make our communities stronger on a day that was intended to tear them apart.",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Our September 11th Day of Service will next take place in 2026 for the 25th Anniversary.",
              style: GoogleFonts.quicksand(fontSize: 15, color: blackC),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/martinluther.jpg',
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('More Info'),
              onPressed: () {  
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const September11(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: blueC,
              )
            ),
          ]
        )
      )  
    );
  }
}