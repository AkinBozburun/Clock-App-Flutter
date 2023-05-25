import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles
{
  static Color lightBackGroundColor = const  Color(0xffE4E4E4);
  static Color lightBlueColor = const Color(0xff85B6B1);
  Color lightShadowColor = Colors.black26;

  static Color darkBackGroundColor = const  Color(0xff1D1D23);
  Color darkShadowColor = Colors.black38;

  TextStyle tabTxtStyle = TextStyle(color: lightBackGroundColor,fontSize: 12.w,fontWeight: FontWeight.w500);
  TextStyle timeTxtStyle = TextStyle(color: lightBackGroundColor,fontSize: 16.sp,fontWeight: FontWeight.w500);
  TextStyle numberStyle = TextStyle(color: lightBackGroundColor,fontSize: 36.sp,fontWeight: FontWeight.w500);
  TextStyle buttonTxt = TextStyle(color: darkBackGroundColor,fontSize: 16.sp,fontWeight: FontWeight.w600);

}