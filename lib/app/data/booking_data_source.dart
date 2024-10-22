import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/app/models/car_details.dart';
import 'package:ichiban_auto/app/models/customer_details.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingDetailsDataSource extends CalendarDataSource {
  /// Creates a BookingDetails data source, which used to set the appointment
  /// collection to the calendar
  BookingDetailsDataSource(List<BookingDetails> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getBookingDetailsData(index).startDateTime!;
  }

  @override
  DateTime getEndTime(int index) {
    return _getBookingDetailsData(index).endDateTime!;
  }

  @override
  String getSubject(int index) {
    return _getBookingDetailsData(index).title!;
  }

  CarDetails getCarDetails(int index) {
    return _getBookingDetailsData(index).carDetails!;
  }

  CustomerDetails getCustomerDetails(int index) {
    return _getBookingDetailsData(index).customerDetails!;
  }

  BookingDetails _getBookingDetailsData(int index) {
    final dynamic bookingDetail = appointments![index];
    late final BookingDetails bookingDetailsData;
    if (bookingDetail is BookingDetails) {
      bookingDetailsData = bookingDetail;
    }

    return bookingDetailsData;
  }
}
