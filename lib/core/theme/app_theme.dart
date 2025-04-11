import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Color(0xFF1E1E1E),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF00DD8D),
      secondary: Color(0xFF00DD8D),
      background: Colors.black,
      surface: Color(0xFF1E1E1E),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.black, elevation: 0),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF00DD8D),
      unselectedItemColor: Colors.grey,
    ),
  );
}
