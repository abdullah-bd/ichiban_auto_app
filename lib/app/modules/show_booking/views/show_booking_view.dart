import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/booking_details.dart';
import 'package:ichiban_auto/theme/image_assets.dart';
import 'package:ichiban_auto/theme/text_widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../utils/constants.dart';
import '../controllers/show_booking_controller.dart';

class ShowBookingView extends GetView<ShowBookingController> {
  const ShowBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    /// Get the booking details from the calendar tap.
    final details = Get.arguments as CalendarTapDetails;
    final BookingDetails booking = details.appointments![0] as BookingDetails;
    String date = DateFormat('MMMM dd, yyyy')
        .format(booking.startDateTime ?? DateTime.now())
        .toString();
    String start = DateFormat('hh:mm a')
        .format(booking.startDateTime ?? DateTime.now())
        .toString();
    String end = DateFormat('hh:mm a')
        .format(booking.endDateTime ?? DateTime.now())
        .toString();
    final car = booking.carDetails;
    final customer = booking.customerDetails;
    final mechanic = booking.mechanicDetails;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Image.asset(
                    height: 250,
                   carBack,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 20,
                    left: 5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text24(booking.title ?? 'N/A'),
                  const Divider(),
                  detailTile(Icons.calendar_month_rounded, date),
                  detailTile(Icons.access_time_filled_sharp, "$start to $end"),
                  text20(
                    "Car Details",
                  ),
                  const Divider(),
                  detailTile(Icons.car_repair,
                      "${car?.make} ${car?.model} - ${car?.year}"),
                  detailTile(Icons.local_play_outlined,
                      car?.registrationPlate ?? "N/A"),
                  text20(
                    "Customer Details",
                  ),
                  const Divider(),
                  detailTile(Icons.person, customer?.name ?? 'N/A'),
                  detailTile(Icons.phone, customer?.phoneNumber ?? 'N/A'),
                  detailTile(Icons.email_rounded, customer?.email ?? 'N/A'),
                  Constants.user?.role == "admin"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text20(
                              "Assigned Mechanic",
                            ),
                            const Divider(),
                            detailTile(Icons.person, mechanic?.name ?? 'N/A'),
                            detailTile(
                                Icons.email_rounded, mechanic?.email ?? 'N/A'),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a `ListTile` widget for displaying details.
  ListTile detailTile(IconData icon, String text) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
      ),
      title: text14(text),
    );
  }
}
