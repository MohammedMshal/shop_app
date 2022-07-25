import 'package:flutter/material.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: myBrown,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: myBrown
  ),
  scaffoldBackgroundColor: myWight,
  appBarTheme: AppBarTheme(
    color: myWight,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    )
  )
);