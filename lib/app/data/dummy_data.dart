import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';
import 'package:ichiban_auto/app/models/user_model.dart';

final List<BookingDetails> dummyData = [
  BookingDetails(
    title: 'Car Tyre Fix',
    startDateTime: DateTime(2024, 10, 21, 9, 00),
    endDateTime: DateTime(2024, 10, 21, 13, 00),
    carDetails: CarDetails(
      make: 'Toyota',
      model: 'Corolla',
      year: 2020,
      registrationPlate: 'XYZ-1234',
    ),
    customerDetails: CustomerDetails(
      name: 'John Doe',
      phoneNumber: '555-1234',
      email: 'john@example.com',
    ), mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
    createdAt:DateTime.now().millisecondsSinceEpoch,
    role: 'mechanic',
    ),
  ),
  BookingDetails(
    title: 'Engine Oil Change',
    startDateTime: DateTime(2024, 10, 3, 10, 00),
    endDateTime: DateTime(2024, 10, 3, 14, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Honda',
      model: 'Civic',
      year: 2019,
      registrationPlate: 'XYZ-5678',
    ),
    customerDetails: CustomerDetails(
      name: 'Jane Smith',
      phoneNumber: '555-5678',
      email: 'jane@example.com',
    ),
  ),
  BookingDetails(
    title: 'Brake Pad Replacement',
    startDateTime: DateTime(2024, 10, 5, 8, 00),
    endDateTime: DateTime(2024, 10, 5, 12, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Ford',
      model: 'Mustang',
      year: 2018,
      registrationPlate: 'XYZ-8765',
    ),
    customerDetails: CustomerDetails(
      name: 'Bob Johnson',
      phoneNumber: '555-8765',
      email: 'bob@example.com',
    ),
  ),
  BookingDetails(
    title: 'AC Service',
    startDateTime: DateTime(2024, 10, 7, 13, 00),
    endDateTime: DateTime(2024, 10, 7, 16, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'BMW',
      model: 'X5',
      year: 2021,
      registrationPlate: 'XYZ-4321',
    ),
    customerDetails: CustomerDetails(
      name: 'Alice Williams',
      phoneNumber: '555-4321',
      email: 'alice@example.com',
    ),
  ),
  BookingDetails(
    title: 'Battery Replacement',
    startDateTime: DateTime(2024, 10, 9, 14, 00),
    endDateTime: DateTime(2024, 10, 9, 17, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Nissan',
      model: 'Altima',
      year: 2022,
      registrationPlate: 'XYZ-9876',
    ),
    customerDetails: CustomerDetails(
      name: 'Chris Brown',
      phoneNumber: '555-9876',
      email: 'chris@example.com',
    ),
  ),
  BookingDetails(
    title: 'Wheel Alignment',
    startDateTime: DateTime(2024, 10, 10, 9, 00),
    endDateTime: DateTime(2024, 10, 10, 12, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Toyota',
      model: 'Camry',
      year: 2020,
      registrationPlate: 'XYZ-1122',
    ),
    customerDetails: CustomerDetails(
      name: 'David Parker',
      phoneNumber: '555-6543',
      email: 'david@example.com',
    ),
  ),
  BookingDetails(
    title: 'Full Body Wash',
    startDateTime: DateTime(2024, 10, 12, 11, 00),
    endDateTime: DateTime(2024, 10, 12, 13, 30),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Honda',
      model: 'Accord',
      year: 2021,
      registrationPlate: 'XYZ-5543',
    ),
    customerDetails: CustomerDetails(
      name: 'Eve Wilson',
      phoneNumber: '555-3210',
      email: 'eve@example.com',
    ),
  ),
  BookingDetails(
    title: 'Tire Replacement',
    startDateTime: DateTime(2024, 10, 14, 10, 00),
    endDateTime: DateTime(2024, 10, 14, 14, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Nissan',
      model: 'Maxima',
      year: 2019,
      registrationPlate: 'XYZ-8833',
    ),
    customerDetails: CustomerDetails(
      name: 'Sam Green',
      phoneNumber: '555-6789',
      email: 'sam@example.com',
    ),
  ),
  BookingDetails(
    title: 'Suspension Check',
    startDateTime: DateTime(2024, 10, 15, 13, 00),
    endDateTime: DateTime(2024, 10, 15, 17, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Ford',
      model: 'F-150',
      year: 2020,
      registrationPlate: 'XYZ-6677',
    ),
    customerDetails: CustomerDetails(
      name: 'Mike Harper',
      phoneNumber: '555-4567',
      email: 'mike@example.com',
    ),
  ),
  BookingDetails(
    title: 'Fuel Pump Service',
    startDateTime: DateTime(2024, 10, 17, 8, 00),
    endDateTime: DateTime(2024, 10, 17, 12, 00),
    mechanicDetails: UserModel(
      name: 'John Doe',
      email: 'dev@a.com',
      createdAt:DateTime.now().millisecondsSinceEpoch,
      role: 'mechanic',
    ),
    carDetails: CarDetails(
      make: 'Toyota',
      model: 'Corolla',
      year: 2020,
      registrationPlate: 'XYZ-7765',
    ),
    customerDetails: CustomerDetails(
      name: 'Karen White',
      phoneNumber: '555-9873',
      email: 'karen@example.com',
    ),
  ),
  // Additional 10 similar objects follow with varied startDateTime, endDateTime, and details
];
