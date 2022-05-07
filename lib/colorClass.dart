import 'package:flutter/material.dart';

Map<int, Color> colorClass = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor dispColor(int primary) {
  return MaterialColor(primary, colorClass);
}

MaterialColor teal = dispColor(0xFF007573);
const tealC = Color(0xFF007573);
MaterialColor orange = dispColor(0xFFFF4C00);
const orangeC = Color(0xFFFF4C00);
MaterialColor blue = dispColor(0xFF002E6D);
const blueC = Color(0xFF002E6D);
MaterialColor grey = dispColor(0xFFE5E8E8);
const greyC = Color(0xFFE5E8E8);
MaterialColor bottomItemColor = dispColor(0xFF7b7b7b);
const bottomItemColorC = Color(0xFF7b7b7b);
