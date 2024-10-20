import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';

class AweseomSnackBarExample extends StatelessWidget {
  const AweseomSnackBarExample({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Awesome SnackBar'),
          onPressed: () {
            var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message: message,
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}

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
