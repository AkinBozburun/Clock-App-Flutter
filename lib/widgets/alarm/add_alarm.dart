import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/alarm/alarm_time_picker.dart';
import 'package:provider/provider.dart';

class AddAlarm extends StatefulWidget
{
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm>
{
  Widget _button(Function() press,txt) => TextButton
  (
    onPressed: press,
    child:  Text(txt),
  );

  _setAlarm()
  {
    final provider = Provider.of<AlarmProvider>(context,listen: false);

    final time = DateTime.now();

    AndroidAlarmManager.oneShotAt
    (
      provider.parseAlarm(time.year, time.month, time.day),
      0, AlarmProvider.showAlarmNotification,
      alarmClock: true,exact: true,wakeup: true,
    )
    .then((value) => Navigator.pop(context));
  }

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
          SizedBox(height: 20.h),
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
            _button(()
            {
              Navigator.pop(context);
            },
            "İptal et"),
            _button(()
            {
              //_setAlarm();
            },
            "Oluştur"),
          ]),
        ],
      ),
    );
  }
}