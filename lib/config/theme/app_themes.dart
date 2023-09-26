import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.red,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
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