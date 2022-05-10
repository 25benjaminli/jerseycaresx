import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colorClass.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              "CORPORATE SPONSORS",
              style: GoogleFonts.quicksand(fontSize: 25, 
              color: blueC,
              ),
            ),
            Text(
              "2021-2022",
              style: GoogleFonts.quicksand(fontSize: 20, 
              backgroundColor: tealC,
              color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "LEADERSHIP - \$125,000 - \$249,999",
              style: TextStyle(fontSize: 25, color: blueC),
              textAlign: TextAlign.center,
            ),

          ]
        )
      )
    );
  }
}