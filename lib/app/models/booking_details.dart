import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';

class BookingDetails {
  final String title;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final CarDetails carDetails;
  final CustomerDetails customerDetails;

  BookingDetails({
    required this.title,
    required this.startDateTime,
    required this.endDateTime,
    required this.carDetails,
    required this.customerDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'startDateTime': startDateTime.toIso8601String(),
      'endDateTime': endDateTime.toIso8601String(),
      'carDetails': carDetails.toJson(),
      'customerDetails': customerDetails.toJson(),
    };
  }
}