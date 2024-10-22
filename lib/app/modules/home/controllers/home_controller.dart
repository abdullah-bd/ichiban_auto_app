import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';

class HomeController extends GetxController {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  var bookings = <BookingDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    _database.ref("booking").onValue.listen((event) {
      var bookings = <BookingDetails>[];
      var data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        var honolulu = entry;
        for (var booking in honolulu.value.entries) {
          for (var bookingDetails in booking.value.entries) {
            print(bookingDetails.value);

            bookings.add(BookingDetails.fromJson(bookingDetails.value));
          }
          // arrayOfMechanic.add(BookingDetails.fromJson(booking));
        }
      }

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
