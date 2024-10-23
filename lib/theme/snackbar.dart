import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';


void showSnackBar(String title, String message,
    [ContentType? contentType] ) {

  contentType ??= ContentType.help;
  final materialBanner = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: AwesomeSnackbarContent(
        title: title,
        message: message,


        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    ),
  );

  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentMaterialBanner()
    ..showSnackBar(materialBanner);
}
