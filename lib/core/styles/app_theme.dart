import 'package:flutter/material.dart';

enum AppTheme { dark, light }

final appThemeData = {
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
  ),
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
  ),
};
