import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

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

  void increment() => count.value++;
}
