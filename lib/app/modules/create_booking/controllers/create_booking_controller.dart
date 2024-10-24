import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/data/data_provider.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';
import 'package:ichiban_auto/app/models/user_model.dart';
import 'package:ichiban_auto/utils/extensions.dart';
import 'package:intl/intl.dart';

class CreateBookingController extends GetxController {
  /// An instance of `DataProvider` to handle data operations.
  final DataProvider _provider = DataProvider();

  /// Controllers for various input fields in the booking form.
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

  /// Observables for start and end dates and times.
  var startDate = Rxn<DateTime>();
  var startTime = Rxn<TimeOfDay>();
  var endDate = Rxn<DateTime>();
  var endTime = Rxn<TimeOfDay>();

  /// A key to identify the booking form.
  final formKey = GlobalKey<FormState>();

  /// An observable list of mechanics.
  var arrayOfMechanic = <UserModel>[].obs;

  /// The selected mechanic for the booking.
  UserModel? selectedMechanic;

  @override
  void onInit() {
    super.onInit();
    _provider.getMechanics().then((value) {
      arrayOfMechanic.value = value;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Function to set the selected date
  void pickStartDate(DateTime date) {
    startDate.value = date;
    startDateController.text = formattedDate(date);
    endDate.value = date;
    endDateController.text = formattedDate(date);
  }

  /// Sets the selected start date and updates the corresponding controllers.
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
    if (!startDateTime.isBefore(endDateTime)) {
      EasyLoading.showError("End time must be after start time");
      return;
    }
    endTimeController.text = formatTimeOfDay(time);

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

  /// Submits the booking details to the data provider.

  Future<void> submitBooking() async {
    if (!formKey.currentState!.validate()) return;

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

    _provider.createBooking(
        bookingDetails, selectedMechanic!.email?.firebaseEmail);
  }
}
