import 'package:get/get.dart';

import '../controllers/create_booking_controller.dart';

class CreateBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBookingController>(
      () => CreateBookingController(),
    );
  }
}
