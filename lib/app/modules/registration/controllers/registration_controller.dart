import 'package:get/get.dart';
import 'package:ichiban_auto/utils/utils.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

  final count = 0.obs;

  var radioValue = "1".obs;

  var selecterRole = Role.mechanic.obs;
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

  void increment() => count.value++;
}
