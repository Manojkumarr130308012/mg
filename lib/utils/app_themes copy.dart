import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    /*AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 10.0,
          color: ColorResource.colorFFFFFF,
        ),
      ),
    ),*/
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.white),
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'Roboto-Regular',
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
