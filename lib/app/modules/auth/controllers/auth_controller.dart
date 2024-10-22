import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/data/data_provider.dart';
import 'package:ichiban_auto/utils/extensions.dart';

class AuthController extends GetxController {
  final DataProvider _provider = DataProvider();

  var emailController = TextEditingController(text: "a@b.com");

  var passwordController = TextEditingController(text: "11111111");

  RxBool obscure = true.obs;

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
    if(emailController.text.isValidEmail() == false) {
      Get.snackbar("Error", "Please provide a valid email!");
      return;
    }
    if(passwordController.text.length < 8) {
      Get.snackbar("Error", "Password must be at least 8 characters long!");
      return;
    }
    _provider.signIn(emailController.text, passwordController.text);
  }
}
