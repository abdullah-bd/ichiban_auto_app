import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/theme/dashboard_appbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../theme/Colors.dart';
import '../../../../theme/text_widgets.dart';
import '../../../../utils/constants.dart';
import '../../../data/booking_data_source.dart';
import '../../../data/dummy_data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarWidgetDashboard(controller),
      body: Obx(() =>  SfCalendar(
          allowAppointmentResize: false,
          showNavigationArrow: true,
          showCurrentTimeIndicator: true,
          todayHighlightColor: primaryDarkColor,
          view: CalendarView.month,
          backgroundColor: whitish,
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: primaryDarkColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
          ),
          allowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month,
          ],
          allowViewNavigation: true,
          timeSlotViewSettings: const TimeSlotViewSettings(
            timeIntervalHeight: -1,
          ),
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            dayFormat: 'EEE',
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
          dataSource: BookingDetailsDataSource(controller.bookings.value),
          onTap: calendarTapped,
        ),
      ),
      floatingActionButton: Offstage(
        offstage: Constants.user?.role == "mechanic",
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(Routes.CREATE_BOOKING);
          },
          backgroundColor: primaryColor,
          label: text14('Create Booking', color: whitish),
          icon: Icon(
            Icons.add,
            color: whitish,
          ),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      Get.toNamed(Routes.SHOW_BOOKING, arguments: details);
    }
  }
}
