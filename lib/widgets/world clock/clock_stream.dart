import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_clock_app/styles/app_style.dart';

class ClockWidget extends StatelessWidget
{
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder
    (
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) =>
      Text(DateFormat('HH:mm:ss').format(DateTime.now()),
      style: TextStyle(color: AppStyles.softWhite,fontSize: 30)),
    );
  }
}