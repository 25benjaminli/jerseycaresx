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
                    ),
                  ),
                  Text(
                    "2021-2022",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: tealC,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "LEADERSHIP - \$125,000 - \$249,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white70,
                      backgroundColor: tealC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/UBSreal.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/RWJ.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/prudential.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/barclays.jpeg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "PREMIER - \$100,000 - \$124,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white70,
                      backgroundColor: tealC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/rao.jpeg',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/vertex.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "PROMINENT - \$50,000 - \$74,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white70,
                      backgroundColor: tealC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/bnp.jpeg',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/metlife.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/fidelity.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/jpmorgan.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/nbacares.jpeg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "PATRON - \$25,000 - \$49,999",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white70,
                      backgroundColor: tealC,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/goldman.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/nasdaq.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/bankofamerica.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/lilly.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'assets/image/loreal.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ])));
  }
}
