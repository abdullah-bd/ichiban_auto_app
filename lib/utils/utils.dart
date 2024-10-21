import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';
import '../theme/Colors.dart';
import '../theme/snackbar.dart';

class Utils {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 90.0
      ..radius = 20.0
      ..progressColor = primaryColor
      ..backgroundColor = gray
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..maskType = EasyLoadingMaskType.black
      ..loadingStyle = EasyLoadingStyle.light;
  }

  static int calculateMinutes(String time) {
    var timeSplit = time.split(":");
    var hour = int.parse(timeSplit[0]);
    var minute = int.parse(timeSplit[1]);
    var minutes = hour * 60 + minute;
    return minutes;
  }

  static Widget loadNormalImage(File img) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: SizedBox.fromSize(
        size: const Size.fromRadius(50), // Image radius
        child: Image.file(img, fit: BoxFit.cover),
      ),
    );
  }

  static void getxSnackbar(String message, Color color) {

    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error!',
        message:message,
        contentType: ContentType.failure,
      ),
    );


    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }


  static void portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static void showProviderError(int? errorStatus, String? message) async {
    EasyLoading.dismiss();

    if (errorStatus == null) {
      getxSnackbar("$message!", primaryDarkColor);
    } else {
      switch (errorStatus) {
        case 401:
          // getxSnackbar("Ops !", "Unauthorized!", red);
          // showSnackBar("Unauthorized");

          getxSnackbar("Session Expired!", primaryDarkColor);
          // Get.offAllNamed(Routes.AUTH);

          break;
        default:
          {
            getxSnackbar("$message!", primaryDarkColor);
          }
          break;
      }
    }
    // if (responseData["message"] == "Unauthenticated.") {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.clear();
    //   getxSnackbar("Ops !", "Something went wrong!", red);
    //   Get.offNamed(Routes.AUTH);
    //   return;
    // }
    // getxSnackbar("Ops !", "${responseData["message"]}", red);
    // print(err.toString());
    // } catch (e) {
    //   getxSnackbar("Ops !", "Something went wrong!", red);
    // }
  }

  static void showControllerError(response) {
    EasyLoading.dismiss();
    getxSnackbar("${response}", primaryDarkColor);
  }

  static String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int seconds;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    seconds = int.parse(parts[parts.length - 1]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }
}

// check array of string is zero or not
bool allZero(List<String> list) {
  for (var i = 0; i < list.length; i++) {
    if (list[i].isNotEmpty) {
      if (double.parse(list[i]) != 0.0) {
        return false;
      }
    }
  }
  return true;
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
enum Role { admin,mechanic }