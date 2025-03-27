import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    surface: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.grey,
    surface: Colors.grey.withAlpha(100),
  ),
);
