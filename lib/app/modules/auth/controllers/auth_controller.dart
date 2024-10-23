import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/data/data_provider.dart';
import 'package:ichiban_auto/utils/extensions.dart';
import 'package:ichiban_auto/utils/utils.dart';

class AuthController extends GetxController {
  /// An instance of `DataProvider` to handle data operations.
  final DataProvider _provider = DataProvider();

  /// A `TextEditingController` for the email input field.
  var emailController = TextEditingController();

  /// A `TextEditingController` for the password input field.
  var passwordController = TextEditingController();

  /// An observable boolean to toggle the visibility of the password.
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

  /// Signs in a user with the email and password provided in the text controllers.
  ///
  /// This method validates the email and password, and if valid, calls the
  /// `signIn` method of the `DataProvider`.
  Future<void> signInWithEmailAndPassword() async {
    if(emailController.text.isValidEmail() == false) {
      Utils.showControllerError( "Please provide a valid email!");
      return;
    }
    if(passwordController.text.isEmpty) {
      Utils.showControllerError("Please provide a password!");
      return;
    }
    if(passwordController.text.length < 8) {
      Utils.showControllerError("Password must be at least 8 characters long!");
      return;
    }
    _provider.signIn(emailController.text, passwordController.text);
  }
}
