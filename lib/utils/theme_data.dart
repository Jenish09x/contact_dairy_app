import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 48, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, color: Colors.black),
      titleSmall: TextStyle(fontSize: 20, color: Color(0xff637381)),
    ),
    brightness: Brightness.light);

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, color: Colors.black),
      titleSmall: TextStyle(fontSize: 20, color: Color(0xff637381)),
    ),
    brightness: Brightness.dark);
