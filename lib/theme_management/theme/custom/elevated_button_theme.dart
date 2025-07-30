import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.white.withValues(alpha: 0.5),
      disabledBackgroundColor: Colors.blue.withValues(alpha: 0.5),
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.tealAccent,
      disabledForegroundColor: Colors.black.withValues(alpha: 0.5),
      disabledBackgroundColor: Colors.tealAccent.withValues(alpha: 0.5),
      side: const BorderSide(color: Colors.tealAccent),
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    ),
  );
}
