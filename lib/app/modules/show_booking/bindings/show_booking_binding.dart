import 'package:get/get.dart';

import '../controllers/show_booking_controller.dart';

class ShowBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowBookingController>(
      () => ShowBookingController(),
    );
  }
}
