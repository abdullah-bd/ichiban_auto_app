import 'package:get/get.dart';
import 'package:ichiban_auto/app/data/data_provider.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/utils/constants.dart';

class HomeController extends GetxController {
  final DataProvider _provider = DataProvider();

  var bookings = <BookingDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Constants.user?.role == "mechanic") {
      _provider.getMechanicsBooking();
    } else {
      _provider.getAllBooking();
    }
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
