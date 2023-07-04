import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFFAFA),
    fontFamily: GoogleFonts.rajdhani().fontFamily,
    appBarTheme: AppBarTheme(
      color:Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: textTheme(),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme(){
  return TextTheme(
    displayLarge: TextStyle(color: Colors.black,
      fontSize:30,
        fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold
    ),
    displaySmall: TextStyle(color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: Colors.black,
        fontSize: 8,
        fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: Colors.black,
        fontSize: 35,
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.black, fontSize: 22),
    titleSmall: TextStyle(color: Colors.black, fontSize: 20),
    labelLarge: TextStyle(color: Colors.black, fontSize: 30),
    labelMedium: TextStyle(color: Colors.white, fontSize: 22),
    labelSmall: TextStyle(color: Colors.white, fontSize: 20),
    );
}
