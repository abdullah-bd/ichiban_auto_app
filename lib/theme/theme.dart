import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/// Returns the theme data for the application.
///
/// This function sets up the primary color, background color,
/// input decoration theme, and visual density for the app.
///
/// \return A `ThemeData` object containing the theme settings.
ThemeData theme() {
  return ThemeData(
    // fontFamily: TextStyle().fontFamily,
    hintColor: primaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

/// Returns the input decoration theme for the application.
///
/// This function sets up the border styles and hint text style
/// for input fields.
///
/// \return An `InputDecorationTheme` object containing the input decoration settings.
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: const BorderSide(color: primaryColor),
    gapPadding: 2.h,
  );
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      hintStyle: TextStyle(color: gray, fontSize: 12.sp));
}

/// A custom text theme for the application.
///
/// This object defines the text styles for various text elements
/// such as titles, labels, and body text.
final TextTheme myTheme = TextTheme(
  titleLarge: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: black),
  labelSmall: TextStyle(
    color: gray,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    color: gray,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    color: gray,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
);