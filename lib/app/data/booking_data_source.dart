import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// A data source for booking details that extends the `CalendarDataSource`
/// from the Syncfusion Flutter Calendar package.
///
/// This class is used to provide booking details to the calendar widget.
class BookingDetailsDataSource extends CalendarDataSource {
  /// Creates a BookingDetails data source, which is used to set the appointment
  /// collection to the calendar.
  ///
  /// \param source A list of `BookingDetails` objects.
  BookingDetailsDataSource(List<BookingDetails> source) {
    appointments = source;
  }

  /// Returns the start time of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The start time of the appointment.
  @override
  DateTime getStartTime(int index) {
    return _getBookingDetailsData(index).startDateTime!;
  }

  /// Returns the end time of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The end time of the appointment.
  @override
  DateTime getEndTime(int index) {
    return _getBookingDetailsData(index).endDateTime!;
  }

  /// Returns the subject of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The subject of the appointment.
  @override
  String getSubject(int index) {
    return _getBookingDetailsData(index).title!;
  }

  /// Returns the car details of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The car details of the appointment.
  CarDetails getCarDetails(int index) {
    return _getBookingDetailsData(index).carDetails!;
  }

  /// Returns the customer details of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The customer details of the appointment.
  CustomerDetails getCustomerDetails(int index) {
    return _getBookingDetailsData(index).customerDetails!;
  }

  /// Returns the booking details data of the appointment at the given index.
  ///
  /// \param index The index of the appointment.
  /// \return The booking details data of the appointment.
  BookingDetails _getBookingDetailsData(int index) {
    final dynamic bookingDetail = appointments![index];
    late final BookingDetails bookingDetailsData;
    if (bookingDetail is BookingDetails) {
      bookingDetailsData = bookingDetail;
    }

    return bookingDetailsData;
  }
}