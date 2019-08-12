import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    cardColor: Colors.lightBlue[700],
    primaryColorBrightness: Brightness.light,
  );

  static ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.lightBlue[600],
    primaryColorLight: Colors.lightBlue[400],
    primaryColorDark: Colors.lightBlue[600],
    accentColor: Colors.orangeAccent[400],
    cardColor: Colors.lightBlue[700],
  );
}
