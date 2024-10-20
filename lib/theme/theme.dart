import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

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
  // bodyLarge: TextStyle(
  //   color: Color(0xFF333333),
  //   fontSize: 14,
  //   fontWeight: FontWeight.w500,
  // ),

  // headline2: TextStyle(
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.w500,
  //     color: primaryDarkColor),
  // headline3:
  // TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: primaryDarkColor),
  // headline4: TextStyle(
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.w500,
  //     color: primaryDarkColor),
  // headline5: TextStyle(
  //     fontSize: 10.sp, fontWeight: FontWeight.normal, color: primaryDarkColor),
  // headline6: TextStyle(
  //     fontSize: 20, fontWeight: FontWeight.w500),
  // subtitle1: TextStyle(
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.normal,
  //     color: textBlack),
  // subtitle2: TextStyle(
  //     fontSize: 14.sp,
  //     fontWeight: FontWeight.normal,
  //     color: textBlack),
  // bodyText1: TextStyle(
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.normal,
  //     color: textBlack),
  // bodyText2: TextStyle(
  //     fontSize: 10.sp,
  //     color: textBlack),
  // button: TextStyle(
  //     fontSize: 14.sp, fontWeight: FontWeight.normal),
  // caption: TextStyle(
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.normal,
  //     color: Colors.white),
  // overline: TextStyle(
  //     fontSize: 10.sp,
  //     fontWeight: FontWeight.normal,
  //     color: Colors.grey),
);
