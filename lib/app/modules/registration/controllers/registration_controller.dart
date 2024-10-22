import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/utils/extensions.dart';
import 'package:ichiban_auto/utils/utils.dart';

import '../../../../utils/constants.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase _database = FirebaseDatabase.instance;


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

  Future<void> register() async {
    if (nameController.text.isEmpty) {
      Utils.getxSnackbar("Name is required!", Colors.red);
      return;
    }

    if (emailController.text.isEmpty || !emailController.text.isValidEmail()) {
      Utils.getxSnackbar("Please provide a valid email!", Colors.red);
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

    await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) async {
      EasyLoading.dismiss();
      var userType = selectedRole.value == Role.admin ? "admin" : "mechanic";
      await _database.ref("$userType/${emailController.text.firebaseEmail}").set({
        "name": nameController.text,
        "email": emailController.text,
        "role": selectedRole.value == Role.admin ? "admin" : "mechanic",
        "createdAt": DateTime.now().millisecondsSinceEpoch,
      });

      await _database.ref("user/${emailController.text.firebaseEmail}").set({
        "name": nameController.text,
        "email": emailController.text,
        "role": selectedRole.value == Role.admin ? "admin" : "mechanic",
        "createdAt": DateTime.now().millisecondsSinceEpoch,
      });

      Constants.user = UserModel(
        name: nameController.text,
        email: emailController.text,
        role: selectedRole.value == Role.admin ? "admin" : "mechanic",
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      Get.offAllNamed(Routes.HOME);
    }).catchError((error) {
      EasyLoading.dismiss();
      printError(info: error.toString());
      Utils.showControllerError(error);
    });


  }
}
