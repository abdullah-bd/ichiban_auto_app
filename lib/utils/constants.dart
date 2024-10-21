import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../app/models/user_model.dart';
import '../theme/Colors.dart';
class Constants {
  static var headers = {'Accept': "application/json"};
  static var ROLE = "";
  static var PORTFOLIO = "";
  static var branchID = "";
  static var fcmToken = "";
  static var photo = "";

  static var ID = "";
  static var DES = "";
  static var loginHeaders = {'Accept': "application/json"};

  // static var baseUrl = "https://rnd.appinionbd.com/meghna-bank-demo";

  // static var baseUrl = "https://rnd.appinionbd.com/meghna-bank-test";

  // static var baseUrl = "https://rnd.appinionbd.com/prime-bank";

  // static var baseUrl = "https://primermuat.primebank.com.bd";

  // static var baseUrl = "http://13.233.123.119";


  static var baseUrl = dotenv.env['BASE_URL'];

  static var myPlannerColor = {
    "increase": const Color(0xFFEBFFF3),
    "decrease": const Color(0xFFFFF0ED),
    "equal": Colors.white,
    "": Colors.white,
  };
  static var performanceColor = {
    "good": const Color(0xFF37C92B),
    "medium": const Color(0xFFFF9800),
    "poor": const Color(0xFFDF3034),
    "": Colors.green,
  };


  static var monthName = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  static var medals = [
    "assets/images/medal.png",
    "assets/images/medal.png",
    "assets/images/medal (1).png",
    "assets/images/medal (2).png"
  ];
  static var filters = [
    "High to Low",
    "Low to High",
  ];

  static var filterIcons = [
    Icons.arrow_downward,
    Icons.arrow_upward,
  ];

  static String token = "";
  static String resetPassToken = "";

  static var selectedTrainingLesson;

  static String ROLEID = "";
  static String NAME = "";



  static var buttonText = {
    "pdf": "Read PDF",
    "ppt": "Read PPT",
    "video": "Watch Video",
    "interactive-video": "Watch Video",
    "audio": "Listen Audio",
    "quiz": "Take Quiz"
  };

  static String finalAssesDate = "";
  static ShapeDecoration shapeDecoration = ShapeDecoration(
    gradient: const LinearGradient(
      begin: Alignment(0.77, -0.64),
      end: Alignment(-0.77, 0.64),
      colors: [primaryDarkColor, primaryColor],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    shadows: const [
      BoxShadow(
        color: primaryColor,
        blurRadius: 4,
        offset: Offset(0, 2),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: primaryColor,
        blurRadius: 6,
        offset: Offset(0, 0),
        spreadRadius: 0,
      )
    ],
  );

  static UserModel? user;
}

