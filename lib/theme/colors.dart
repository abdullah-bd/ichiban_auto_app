
import 'package:flutter/material.dart';

const Color primaryColor = lightBlue;
const Color primaryDarkColor = darkBlue;
const Color secondaryColor = whitish;

const Color darkBlue = Color(0xFF0C48A2);
const Color lightBlue = Color(0xFF2095F2);
const Color whitish = Color(0xffEEF3F6);

const Color lightGray = Color(0xFF7E7E7E);

const Color lightGrayContainer =Color(0xFFFAFAFA);

const Color purple = Color(0xffD0293F);
const Color deepBlue = Color(0xff005EA5);
const Color darkWhite = Color(0xffEEF3F6);
const Color backgroundColor = Color(0xffE3F2FD);
const Color offWhite = Color(0xffF2F2F2);
const Color lighterBlue = Color(0xFFE9F4FE);
const Color darkerWhite = Color(0xff7D868F);
const Color yellow = Color(0xffFFBF47);
const Color green = Color(0xff00823B);
const Color lightGreen = Color(0xff49DEB2);
const Color deepGreen = Color(0xff0FC071);
const Color skyBlue = Color(0xff0AB2FF);
const Color red = Color(0xffFF3863);
const Color gray = Color(0xFF7D7D7D);
const Color textGray = Colors.grey;
const Color gray3 = Color(0xffF5F5F5);
const Color black = Color(0xff0B0C0C);
const Color textBlack = Color(0xff333333);
const Color noticeColor = Color(0xffFFF1C1);
const Color lightRed = Color(0xffFF5F81);
const Color countBack = Color(0x99333333);
const Color progressColor = Color(0xFF49DEB2);
const Color lightRedd = Color(0xFFFF5F81);
const Color whiteTransparent = Color(0xFFCBDCCB);
const Color portfolioBlue = Color(0xFFBBDEFB);

var gradientShapeDecoration = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.77, -0.64),
    end: Alignment(-0.77, 0.64),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(100),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
var gradientShapeDecorator = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.77, -0.64),
    end: Alignment(-0.77, 0.64),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
var gradientOtherShapeDecorator = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(-0.77, 0.64),
    end: Alignment(0.77, -0.64),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
var gradientTopBottomShapeDecorator = ShapeDecoration(
  gradient: const LinearGradient(
    begin: const Alignment(0.0, -1),
    end: const Alignment(0.0, 0.6),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
var gradientForFilter = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.77, -0.64),
    end: Alignment(-0.77, 0.64),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
var gradientForFAB = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.77, -0.64),
    end: Alignment(-0.77, 0.64),
    colors: [Color(0xFF0C48A2), Color(0xFF2095F2)],
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
      side: BorderSide(color: primaryColor)),
  shadows: const [
    BoxShadow(
      color: Color(0x142095F2),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x052095F2),
      blurRadius: 6,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ],
);
