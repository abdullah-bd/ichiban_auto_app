
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text text10(String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 10.sp,
      fontWeight: fontWeight,
    ),
  );
}

Text text_16_400(String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w400}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: fontWeight,
    ),
  );
}

Text text12(String text,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
    int? maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: 12.sp,
      fontWeight: fontWeight,
    ),
  );
}

Text text14(String text,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
    int? maxLines,
    TextOverflow? textOverflow}) {
  return Text(text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow);
}

Text text16(String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: fontWeight,
    ),
  );
}

Text text20(String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w700}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 20.sp,
      fontWeight: fontWeight,
    ),
  );
}

Text text24(String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 24.sp,
      fontWeight: fontWeight,
    ),
    overflow: TextOverflow.ellipsis,
  );
}

