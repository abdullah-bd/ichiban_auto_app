import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/utils/constants.dart';
import 'package:ichiban_auto/utils/extensions.dart';

class HomeController extends GetxController {

  final _database = FirebaseDatabase.instance;

  var bookings = <BookingDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Constants.user?.role == "mechanic") {
      getMechanicsBooking();
    } else {
      getAllBooking();
    }
  }

  void getAllBooking() {
    _database.ref("booking").onValue.listen((event) {
      var bookings = <BookingDetails>[];
      var data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        for (var booking in entry.value.entries) {
          print(booking.value);

          bookings.add(BookingDetails.fromJson(booking.value));

          // arrayOfMechanic.add(BookingDetails.fromJson(booking));
        }
      }

      this.bookings.value = bookings;
      // this.arrayOfMechanic.value = arrayOfMechanic;
    });
  }

  void getMechanicsBooking() {
    _database
        .ref("booking/${Constants.user!.email!.firebaseEmail}")
        .onValue
        .listen((event) {
      var bookings = <BookingDetails>[];
      var data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        print(entry.value);

        bookings.add(BookingDetails.fromJson(entry.value));
      }
      // arrayOfMechanic.add(BookingDetails.fromJson(booking));

      this.bookings.value = bookings;
      // this.arrayOfMechanic.value = arrayOfMechanic;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
