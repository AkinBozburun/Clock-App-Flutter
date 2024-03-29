import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/styles/app_style.dart';

Widget button(void Function() press, Color color, String txt)
{
  final radius = BorderRadius.circular(25);

  return InkWell
  (
    onTap: press,
    borderRadius: radius,
    child: Ink
    (
      height: 40.h,
      width: 140.w,
      decoration: BoxDecoration
      (
        color: color,
        borderRadius: radius,
      ),
      child: Center(child: Text(txt,style: AppStyles.buttonTxt)),
    ),
  );
}

Widget txtButton(Function() press,String txt,TextStyle style) => InkWell
(
  onTap: press,
  borderRadius: BorderRadius.circular(25),
  child: Ink
  (
    height: 40,
    width: ScreenUtil().screenWidth/3,
    child: Center(child: Text(txt,style: style))
  ),
);