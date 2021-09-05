import 'package:flutter/material.dart';

ThemeData colorTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: Colors.green,
      accentColor: Colors.greenAccent,
      buttonColor: Colors.greenAccent,
      scaffoldBackgroundColor: Colors.grey[100],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.green)));
}
