import 'package:flutter/material.dart';

List<Icon> thermostatModeIcon = [
  Icon(Icons.highlight_off),
  Icon(Icons.toys),
  Icon(Icons.ac_unit),
  Icon(Icons.local_fire_department)
];

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.blue,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Color.fromRGBO(16, 16, 16, 1.0),
  canvasColor: Colors.black,
  //accentColor: Colors.white,
  //accentIconTheme: IconThemeData(color: Colors.black),
  //dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

final testTheme = ThemeData.dark();

final ThemeData darkThemeOLED = new ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.indigoAccent[100],
  primaryColor: Color.fromRGBO(5, 5, 5, 1.0),
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  primaryColorLight: Colors.indigo[300],
  buttonColor: Colors.indigoAccent[100],
  //accentIconTheme: new IconThemeData(color: Colors.indigo[300]),
  cardColor: Color.fromRGBO(16, 16, 16, 1.0),
  dividerColor: Color.fromRGBO(20, 20, 20, 1.0),
  bottomAppBarColor: Color.fromRGBO(19, 19, 19, 1.0),
  dialogBackgroundColor: Colors.black,
  textSelectionHandleColor: Colors.indigoAccent[100],
  iconTheme: new IconThemeData(color: Colors.white),
);
