import 'package:flutter/material.dart';

class MyTheme{
  static const Color appColor = Color.fromARGB(207, 10, 65, 31);
}

enum AppThemes{
  lightTheme("Light Theme"),
  darkTheme("Dark Theme");

  final String name;
  const AppThemes(this.name);
}

 final Map appThemeData = {
    AppThemes.lightTheme: ThemeData(
        brightness: Brightness.light,
        primaryColor:MyTheme.appColor,
        appBarTheme: const AppBarTheme(backgroundColor:  MyTheme.appColor)),
  AppThemes.darkTheme: ThemeData(
     brightness: Brightness.dark,
    primaryColor:Colors.grey,
      appBarTheme: const AppBarTheme(backgroundColor:  MyTheme.appColor),
  ),
  };