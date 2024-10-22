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
      Utils.showControllerError(error);
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
    await _database.ref("mechanic").onValue.listen((event) {
      var data = event.snapshot.value as Map;
      data.forEach((key, value) {
        arrayOfMechanic.add(UserModel.fromJson(value));
      });
    });
    return arrayOfMechanic;
  }

  Future<List<BookingDetails>> getAllBooking() async{
    var bookings = <BookingDetails>[];

    _database.ref("booking").onValue.listen((event) {
      var data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        for (var booking in entry.value.entries) {
          print(booking.value);

          bookings.add(BookingDetails.fromJson(booking.value));

          // arrayOfMechanic.add(BookingDetails.fromJson(booking));
        }
      }


      // this.arrayOfMechanic.value = arrayOfMechanic;
    });
    return bookings;
  }

  Future<List<BookingDetails>> getMechanicsBooking() async {
    var bookings = <BookingDetails>[];
    _database
        .ref("booking/${Constants.user!.email!.firebaseEmail}")
        .onValue
        .listen((event) {

      var data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        print(entry.value);

        bookings.add(BookingDetails.fromJson(entry.value));
      }
      // arrayOfMechanic.add(BookingDetails.fromJson(booking));

      // this.arrayOfMechanic.value = arrayOfMechanic;
    });
    return bookings;
  }
}
