import 'package:ichiban_auto/app/models/user_model.dart';

import 'car_details.dart';
import 'customer_details.dart';

/// carDetails : {"make":"Toyota","model":"Camry","registrationPlate":"raj metro 1111","year":2011}
/// customerDetails : {"email":"ab@gmail.com","name":"Md Abdullah","phoneNumber":"01715294605"}
/// endDateTime : "2024-10-22T14:17:00.000"
/// mechanicDetails : {"createdAt":1729534080360,"email":"ab@a.com","name":"Md Abdullah","role":"mechanic"}
/// startDateTime : "2024-10-22T12:17:00.000"
/// title : "Tire change "

class BookingDetails {
  BookingDetails({
    CarDetails? carDetails,
    CustomerDetails? customerDetails,
    DateTime? endDateTime,
    UserModel? mechanicDetails,
    DateTime? startDateTime,
    String? title,}){
    _carDetails = carDetails;
    _customerDetails = customerDetails;
    _endDateTime = endDateTime;
    _mechanicDetails = mechanicDetails;
    _startDateTime = startDateTime;
    _title = title;
  }

  BookingDetails.fromJson(dynamic json) {
    _carDetails = json['carDetails'] != null ? CarDetails.fromJson(json['carDetails']) : null;
    _customerDetails = json['customerDetails'] != null ? CustomerDetails.fromJson(json['customerDetails']) : null;
    _endDateTime = DateTime.parse(json['endDateTime']);
    _mechanicDetails = json['mechanicDetails'] != null ? UserModel.fromJson(json['mechanicDetails']) : null;
    _startDateTime = DateTime.parse(json['startDateTime']);
    _title = json['title'];
  }
  CarDetails? _carDetails;
  CustomerDetails? _customerDetails;
  DateTime? _endDateTime;
  UserModel? _mechanicDetails;
  DateTime? _startDateTime;
  String? _title;
  BookingDetails copyWith({  CarDetails? carDetails,
    CustomerDetails? customerDetails,
    DateTime? endDateTime,
    UserModel? mechanicDetails,
    DateTime? startDateTime,
    String? title,
  }) => BookingDetails(  carDetails: carDetails ?? _carDetails,
    customerDetails: customerDetails ?? _customerDetails,
    endDateTime: endDateTime ?? _endDateTime,
    mechanicDetails: mechanicDetails ?? _mechanicDetails,
    startDateTime: startDateTime ?? _startDateTime,
    title: title ?? _title,
  );
  CarDetails? get carDetails => _carDetails;
  CustomerDetails? get customerDetails => _customerDetails;
  DateTime? get endDateTime => _endDateTime;
  UserModel? get mechanicDetails => _mechanicDetails;
  DateTime? get startDateTime => _startDateTime;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_carDetails != null) {
      map['carDetails'] = _carDetails?.toJson();
    }
    if (_customerDetails != null) {
      map['customerDetails'] = _customerDetails?.toJson();
    }
    map['endDateTime'] = _endDateTime?.toIso8601String();
    if (_mechanicDetails != null) {
      map['mechanicDetails'] = _mechanicDetails?.toJson();
    }
    map['startDateTime'] = _startDateTime?.toIso8601String();
    map['title'] = _title;
    return map;
  }

}

/// createdAt : 1729534080360
/// email : "ab@a.com"
/// name : "Md Abdullah"
/// role : "mechanic"



/// email : "ab@gmail.com"
/// name : "Md Abdullah"
/// phoneNumber : "01715294605"


