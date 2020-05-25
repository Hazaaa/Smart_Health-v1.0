import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getCustomTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(color: Colors.white, elevation: 0.0),
    scaffoldBackgroundColor: Colors.white,
  );
}

TextStyle titleTextStyle() {
  return GoogleFonts.lato(color: Colors.black54);
}

TextStyle subtitleTextStyle() {
  return GoogleFonts.lato(color: Colors.grey);
}
