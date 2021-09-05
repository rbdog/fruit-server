import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'color_theme.dart';
import 'home.dart';

void main() {
  initializeDateFormatting('ja_JP');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      debugShowCheckedModeBanner: false,
      theme: colorTheme(),
      home: Home(),
    );
  }
}
