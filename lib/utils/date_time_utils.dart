import 'package:intl/intl.dart';

class DateTimeUtils {
  static const String MMM_YYYY_STRING = "MMM, yyyy";
  static const String MM_YYYY_NUMBER = "MM/yyyy";
  static const String dd_MMM_yyyy = "dd MMM yyyy";
  static const String Y_M_D = "yyyy-MM-dd";
  static const String Y_M = "yyyy-MM";
  static const String DD_MM_Y = "dd/MM/yyyy";
  static const String dd_mm_yyyy = "dd-MM-yyyy";
  static const String HH_mm_ss = "HH:mm:ss";
  static const String hh_mm_a = "hh:mm a";

  static String getCurrentDateTime(String format) {
    var now = DateTime.now();
    var formatter = DateFormat(format);
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  static String? dateFormat(DateTime now){
    final DateFormat formatter = DateFormat(dd_mm_yyyy);
    final String formatted = formatter.format(now);
    return formatted;
  }


  static String? changeDateFormat(
      String currentFormat, String newFormat, String date) {
    try {
      var datePickerFormat = DateFormat(currentFormat, 'en_US');
      var myFormat = DateFormat(newFormat);

      DateTime dateFromUser = datePickerFormat.parse(date);
      return myFormat.format(dateFromUser);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static DateTime convertStringToDate(String format, String dateStr) {
    final formatter = DateFormat(format);
    return formatter.parse(dateStr);
  }

  static String? changeDateToStringFormat(String date) {
    return changeDateFormat(Y_M_D, dd_MMM_yyyy, date);
  }

  static String? changeTime24To12Format(String time) {
    return changeDateFormat(HH_mm_ss, hh_mm_a, time);
  }

  static bool isStatusChangeable(String actualDateString) {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Subtract two days from the current date
    DateTime twoDaysAgo = currentDate.subtract(Duration(days: 2));

    DateTime actualDate = DateTime.parse(actualDateString);

    // Format the date if needed
    //String formattedDate = DateFormat('yyyy-MM-dd').format(twoDaysAgo);

    if (actualDate.compareTo(twoDaysAgo) <= 0) {
      return false;
    }
    return true;
  }
}