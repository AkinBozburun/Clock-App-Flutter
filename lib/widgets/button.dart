import 'package:flutter/material.dart';
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
      height: 50,
      width: 180,
      decoration: BoxDecoration
      (
        color: color,
        borderRadius: radius,
      ),
      child: Center(child: Text(txt,style: AppStyles().buttonTxt)),
    ),
  );
}