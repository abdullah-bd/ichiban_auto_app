import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/utils/utils.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

  final count = 0.obs;

  var radioValue = "1".obs;

  var selectedRole = Role.mechanic.obs;

  var obscure = true.obs;

  var obscureConfirm = true.obs;

  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

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

  Future<void> register() async {
    if (nameController.text.isEmpty) {
      Utils.getxSnackbar("Name is required!", Colors.red);
      return;
    }

    if (emailController.text.isEmpty) {
      Utils.getxSnackbar("Email is required!", Colors.red);
      return;
    }
    if (passwordController.text != passwordConfirmController.text) {
      Utils.getxSnackbar("Password does not match!", Colors.red);
      return;
    }

    if (passwordController.text.length < 8) {
      Utils.getxSnackbar("Password must be at least 8 characters!", Colors.red);
      return;
    }

    EasyLoading.show();
  }
}
