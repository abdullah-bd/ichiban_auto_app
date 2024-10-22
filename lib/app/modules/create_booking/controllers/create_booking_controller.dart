import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';
import 'package:ichiban_auto/app/models/user_model.dart';
import 'package:ichiban_auto/utils/extensions.dart';
import 'package:intl/intl.dart';

class CreateBookingController extends GetxController {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  final titleController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();

  final carMakeController = TextEditingController();
  final carModelController = TextEditingController();
  final carYearController = TextEditingController();
  final carRegistrationController = TextEditingController();

  final customerNameController = TextEditingController();
  final customerPhoneController = TextEditingController();
  final customerEmailController = TextEditingController();

  var startDate = Rxn<DateTime>();
  var startTime = Rxn<TimeOfDay>();
  var endDate = Rxn<DateTime>();
  var endTime = Rxn<TimeOfDay>();

  final formKey = GlobalKey<FormState>();

  var arrayOfMechanic = <UserModel>[].obs;
  UserModel? selectedMechanic;

  @override
  void onInit() {
    super.onInit();
    _database.ref("mechanic").onValue.listen((event) {
      var arrayOfMechanic = <UserModel>[];
      var data = event.snapshot.value as Map;
      data.forEach((key, value) {
        arrayOfMechanic.add(UserModel.fromJson(value));
      });
      print(arrayOfMechanic);
      this.arrayOfMechanic.value = arrayOfMechanic;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Function to set the selected date
  void pickStartDate(DateTime date) {
    startDate.value = date;
    startDateController.text = formattedDate(date);
    endDate.value = date;
    endDateController.text = formattedDate(date);
  }

  void pickEndDate(DateTime date) {
    if (startDate.value != null && date.isBefore(startDate.value!)) {
      startDate.value = null;
      startDateController.clear();
    }
    endDate.value = date;
  }

  // Function to set the selected time
  void pickStartTime(TimeOfDay time) {
    startTime.value = time;
    startTimeController.text = formatTimeOfDay(time);
  }

  void pickEndTime(TimeOfDay time) {
    endTime.value = time;
    endTimeController.text = formatTimeOfDay(time);
    // TODO: check if start is before end. if its false then it's invalid. We can show proper alert text for this.
    print('------- ${startDateTime.isBefore(endDateTime)}');
  }

  String formattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hours =
        time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod; // Handle 12 AM/PM
    final period = time.period == DayPeriod.am ? "AM" : "PM";

    return '${hours.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  DateTime get startDateTime =>
      combinedDateTime(startDate.value!, startTime.value!);

  DateTime get endDateTime => combinedDateTime(endDate.value!, endTime.value!);

  DateTime combinedDateTime(DateTime selectedDate, TimeOfDay selectedTime) {
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
  }

  Future<void> submitBooking() async {
    if (!formKey.currentState!.validate()) return;
    var path =
        "${startDate.value!.day}d${startDate.value!.month}m${startDate.value!.year}y";

    var bookingDetails = BookingDetails(
        title: titleController.text,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        mechanicDetails: selectedMechanic!,
        carDetails: CarDetails(
            make: carMakeController.text,
            model: carModelController.text,
            year: int.parse(carYearController.text),
            registrationPlate: carRegistrationController.text),
        customerDetails: CustomerDetails(
            name: customerNameController.text,
            phoneNumber: customerPhoneController.text,
            email: customerEmailController.text));

    _database
        .ref("booking/$path/${selectedMechanic?.email!.firebaseEmail}")
        .push()
        .set(bookingDetails.toJson())
        .then((value) {
      Get.back();
      EasyLoading.showSuccess("Successfully created booking");
    });
  }
}
