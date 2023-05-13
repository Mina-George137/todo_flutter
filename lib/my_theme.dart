import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryBlueColor = const Color(0xFF5D9CEC);
  static Color lightBackgroundColor = const Color(0xFFDFECDB);
  static Color darkBackgroundColor = const Color(0xFF060E1E);
  static Color greenColor = const Color(0xFF61E757);
  static Color redColor = const Color(0xFFEC4B4B);
  static Color whiteColor = const Color(0xFFCDCACA);
  static Color blackColor = const Color(0xFF141922);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryBlueColor,
      backgroundColor: lightBackgroundColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: primaryBlueColor, elevation: 0),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        headline2: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: blackColor),
        subtitle1: TextStyle(fontSize: 12, color: blackColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryBlueColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white, width: 4))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: primaryBlueColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryBlueColor,
      backgroundColor: darkBackgroundColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: primaryBlueColor, elevation: 0),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        headline2: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: whiteColor),
        subtitle1: TextStyle(fontSize: 12, color: primaryBlueColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: primaryBlueColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ));
}
