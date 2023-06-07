import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/alarm/alarm_time_picker.dart';

class AddAlarm extends StatefulWidget
{
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm>
{
  Widget _button(txt) => TextButton
  (
    onPressed: () => HapticFeedback.lightImpact(),
    child:  Text(txt),
  );

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body:  Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          SizedBox(height: 10.h),
          const AlarmTimePicker(),
          Container
          (
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(10),
            height: ScreenUtil().screenHeight/2,
            decoration: BoxDecoration
            (
              color: AppStyles.cardColor,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            _button("İptal et"),
            _button("Oluştur"),
          ])
        ],
      ),
    );
  }
}