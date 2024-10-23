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
  /// An instance of `FirebaseAuth` to handle authentication.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// An instance of `FirebaseDatabase` to handle database operations.
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  /// An observable for the selected role (admin or mechanic).
  var selectedRole = Role.mechanic.obs;

  /// An observable boolean to toggle the visibility of the password.
  var obscure = true.obs;

  /// An observable boolean to toggle the visibility of the confirm password.
  var obscureConfirm = true.obs;

  /// A `TextEditingController` for the password input field.
  var passwordController = TextEditingController();

  /// A `TextEditingController` for the confirm password input field.
  var passwordConfirmController = TextEditingController();

  /// A `TextEditingController` for the name input field.
  var nameController = TextEditingController();

  /// A `TextEditingController` for the email input field.
  var emailController = TextEditingController();

  /// A key to identify the registration form.
  var formKey = GlobalKey<FormState>();

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

  /// Registers a new user with the provided information.
  ///
  /// This method validates the form, creates a new user with Firebase
  /// authentication, and stores the user information in the Firebase database
  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    EasyLoading.show();

    await _auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
      EasyLoading.dismiss();
      var userType = selectedRole.value == Role.admin ? "admin" : "mechanic";
      await _database
          .ref("$userType/${emailController.text.firebaseEmail}")
          .set({
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
