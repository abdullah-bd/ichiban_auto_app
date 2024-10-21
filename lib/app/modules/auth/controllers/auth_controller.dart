import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/user_model.dart';
import 'package:ichiban_auto/app/modules/registration/controllers/registration_controller.dart';
import 'package:ichiban_auto/utils/extensions.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {

  var emailController = TextEditingController(text: "a@b.com");

  var passwordController = TextEditingController(text: "11111111");

  RxBool obscure = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

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
    ).then((value) async {
      await _database.ref("user/${emailController.text.firebaseEmail}").get().then((value) {
        EasyLoading.dismiss();
        if (value.exists) {
          Constants.user = UserModel.fromJson(value.value);
          print(Constants.user);
        } else {
          Utils.getxSnackbar("User not found!", Colors.red);
        }
      },);
      EasyLoading.dismiss();
      Get.offAllNamed(Routes.HOME);
    }).catchError((error) {
      EasyLoading.dismiss();
      printError(info: error.toString());
      Utils.showControllerError(error);
    });


  }


}
