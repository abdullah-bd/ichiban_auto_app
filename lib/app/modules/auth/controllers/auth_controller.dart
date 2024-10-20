import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  RxBool obscure = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signInWithEmailAndPassword() async {

    EasyLoading.show();

    await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value) {
      EasyLoading.dismiss();
      Get.offAllNamed(Routes.HOME);
    }).catchError((error) {
      EasyLoading.dismiss();
      printError(info: error.toString());
      Utils.showControllerError(error);
    });


  }


}
