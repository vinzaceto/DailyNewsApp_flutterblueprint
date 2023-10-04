import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Muli',
    appBarTheme: darkAppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2, // elevation
      backgroundColor: Colors.lime, // the background color
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
      ),
      outlineBorder: BorderSide(
        style: BorderStyle.solid,
        color: Colors.white,
      ),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: lightAppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2, // elevation
      backgroundColor: Colors.lime, // the background color
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Colors.black,
        ),
      ),
      outlineBorder: BorderSide(
        style: BorderStyle.solid,
        color: Colors.black,
      ),
    ),
  );
}

AppBarTheme darkAppBarTheme() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  );
}

AppBarTheme lightAppBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  );
}

SearchBarThemeData searchBarTheme() {
  return SearchBarThemeData(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shadowColor: MaterialStateProperty.all(Colors.redAccent),
    //overlayColor: MaterialStateProperty.all(Colors.redAccent),
    hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
    side: MaterialStateProperty.all(const BorderSide(color: Colors.redAccent)),
  );
}