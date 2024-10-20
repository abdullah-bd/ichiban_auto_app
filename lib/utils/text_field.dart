import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/Colors.dart';
import '../theme/text_widgets.dart';

Widget dateField(String title, String hint, String date, Function onPress,
    {bool isRequired = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          text14(
            title,
          )
        ],
      ),
      SizedBox(
        height: 4.h,
      ),
      TextFormField(
        onTap: () async {
          onPress();
        },
        keyboardType: TextInputType.text,
        readOnly: true,
        controller: TextEditingController(text: date),
        decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            hintText: hint,
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.calendar_month_outlined,
                size: 16,
                color: primaryDarkColor,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: 14),
            fillColor: Colors.white,
            filled: true),
      ),
    ],
  );
}

Widget timeField(String title, String hint, String date, Function onPress,
    {bool isRequired = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          text14(
            title,
          )
        ],
      ),
      SizedBox(
        height: 4.h,
      ),
      TextFormField(
        onTap: () async {
          onPress();
        },
        keyboardType: TextInputType.text,
        readOnly: true,
        controller: TextEditingController(text: date),
        decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            hintText: hint,
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.watch_later_outlined,
                size: 16,
                color: primaryDarkColor,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: 14),
            fillColor: Colors.white,
            filled: true),
      ),
    ],
  );
}
