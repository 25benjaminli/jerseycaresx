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
                children: <Widget>[
                  Text(
                    "CORPORATE SPONSORS",
                    style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: blueC,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2021-2022",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: tealC,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "LEADERSHIP - \$125,000 - \$249,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: orangeC,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/UBSreal.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/RWJ.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/prudential.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/barclays.jpeg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "PREMIER - \$100,000 - \$124,999",
                    style: GoogleFonts.quicksand(fontSize: 20, color: orangeC),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/rao.jpeg',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/vertex.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "PROMINENT - \$50,000 - \$74,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: orangeC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bnp.jpeg',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/metlife.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/fidelity.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/jpmorgan.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/nbacares.jpeg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "PATRON - \$25,000 - \$49,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: orangeC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/goldman.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/nasdaq.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/bankofamerica.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/lilly.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/loreal.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ])));
  }
}
