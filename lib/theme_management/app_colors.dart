import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF96416A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD8E6),
  onPrimaryContainer: Color(0xFF3D0024),
  secondary: Color(0xFF735761),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1F1A1C),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB0D0),
  onPrimary: Color(0xFF5C113B),
  primaryContainer: Color(0xFF792952),
  onPrimaryContainer: Color(0xFFFFD8E6),
  secondary: Color(0xFFE1BDCA),
  onSecondary: Color(0xFF412A33),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  surface: Color(0xFF1F1A1C),
  onSurface: Color(0xFFEAE0E3),
);

class AppColors {
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color blue = Colors.blue;
  static const Color tealAccent = Colors.tealAccent;
  static const Color black = Colors.black;
  static const Color gray = Colors.grey;
  static const Color green = Colors.green;
  static const Color darkAppBar = Color(0xFF1F1F1F);
  static const Color darkCard = Color.fromARGB(255, 42, 42, 42);
  static const Color darkScaffoldBackground = Color(0xFF121212);
  static Color lightBlue = Colors.blue[50]!;
  static const Color orange = Colors.deepOrange;
}

// class AppColors {
//   static const primary1 = Color(0xFF181823);
//   static const secondary1 = Color(0xFFFFFFFF);
//   static Color tertiary3(BuildContext context) {
//     return Theme.of(context).brightness == Brightness.light
//         ? const Color(0xFF69C0FF)
//         : const Color(0xFF0094FF);
//   }
// }
