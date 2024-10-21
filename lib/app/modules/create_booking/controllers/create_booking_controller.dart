import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateBookingController extends GetxController {
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

  @override
  void onClose() {
    titleController.dispose();
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    carMakeController.dispose();
    carModelController.dispose();
    carYearController.dispose();
    carRegistrationController.dispose();
    customerNameController.dispose();
    customerPhoneController.dispose();
    customerEmailController.dispose();
    super.onClose();
  }
}
