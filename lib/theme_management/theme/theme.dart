import 'package:demo/theme_management/app_colors.dart';
import 'package:demo/theme_management/theme/custom/elevated_button_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.blue,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.gray,
    ),
    // labelMedium: TextStyle(
    //   fontSize: 15,
    //   fontWeight: FontWeight.bold,
    //   color: AppColors.green,
    // ),
  ),
  elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  appBarTheme: const AppBarTheme(
    elevation: 5,
    centerTitle: false,
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.blue,
  ),
  cardTheme: CardThemeData(color: AppColors.white),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.blue),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.blue[200],
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    contentTextStyle: TextStyle(color: AppColors.black),
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.blue),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.normal),
    floatingLabelStyle: TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.normal,
    ),
    outlineBorder: BorderSide(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blue),
    ),
  ),
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
  primaryColor: AppColors.tealAccent,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.white70,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      //fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColors.green,
    ),
  ),
  elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  appBarTheme: const AppBarTheme(
    elevation: 5,
    centerTitle: false,
    backgroundColor: AppColors.darkAppBar,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.black,
    backgroundColor: AppColors.white,
  ),
  cardTheme: CardThemeData(color: AppColors.darkCard),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.white),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.tealAccent,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    contentTextStyle: TextStyle(color: AppColors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: AppColors.tealAccent,
      fontWeight: FontWeight.normal,
    ),
    focusColor: AppColors.tealAccent,
    hoverColor: AppColors.tealAccent,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.tealAccent),
    ),
  ),
  brightness: Brightness.dark,
);
