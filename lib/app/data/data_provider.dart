import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/utils/extensions.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../models/booking_details.dart';
import '../models/user_model.dart';
import '../routes/app_pages.dart';

class DataProvider extends GetConnect {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  @override
  void onInit() {}

  Future<void> signIn(String email, String password) async {
    EasyLoading.show();
    await _auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      await _database.ref("user/${email.firebaseEmail}").get().then(
        (value) {
          if (value.exists) {
            Constants.user = UserModel.fromJson(value.value);
            Get.offAllNamed(Routes.HOME);
          } else {
            Utils.getxSnackbar("User not found!", Colors.red);
          }
        },
      );
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
      printError(info: error.toString());
      Utils.showControllerError(error.toString().contains("]")?error.toString().split("]")[1]:error.toString());
    });
  }

  Future<void> createBooking(
      BookingDetails bookingDetails, firebaseEmail) async {
    _database
        .ref("booking/$firebaseEmail")
        .push()
        .set(bookingDetails.toJson())
        .then((value) {
      Get.back();
      EasyLoading.showSuccess("Successfully created booking");
    });
  }

  Future<List<UserModel>> getMechanics() async {
    var arrayOfMechanic = <UserModel>[];

    var data = await _database.ref("mechanic").get();
    if (data.exists) {
      var dataValue = data.value as Map;
      dataValue.forEach((key, value) {
        arrayOfMechanic.add(UserModel.fromJson(value));
      });
    }
    return arrayOfMechanic;
  }
}
