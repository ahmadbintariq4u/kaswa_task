import 'package:flutter/material.dart';

getLightTheme() {
  final base =
      ThemeData.light().copyWith(cardTheme: const CardTheme(elevation: 4));
  return base;
}
