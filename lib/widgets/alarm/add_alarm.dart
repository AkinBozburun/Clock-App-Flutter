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
  Widget _txtButton(Function() press,txt) => InkWell
  (
    onTap: press,
    borderRadius: BorderRadius.circular(25),
    child: Ink
    (
      height: 40,
      width: ScreenUtil().screenWidth/3,
      child: Center(child: Text(txt,style: AppStyles.subTxtStyle))
    ),
  );

  _dayPicker()
  {
    final provider = Provider.of<AlarmProvider>(context);

    return SizedBox
    (
      height: 36,
      child: GridView.builder
      (
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40.w, mainAxisSpacing: 10, mainAxisExtent: 40),
        itemCount: 7,
        itemBuilder: (context, index) => InkWell
        (
          onTap: () => provider.pickDay(index),
          child: AnimatedContainer
          (
            width: 36,
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration
            (
              borderRadius: BorderRadius.circular(16),
              color: provider.days[index]["isSelected"] == true ?
               AppStyles.blueColor : Colors.transparent
            ),
            child: Center
            (
              child: Text(provider.days[index]["day"],
                style: provider.days[index]["isSelected"] == true ?
                AppStyles.darkTxtStyle : AppStyles.subTxtStyle),
            ),
          ),
        ),
      ),
    );
  }

  _setAlarm()
  {
    final provider = Provider.of<AlarmProvider>(context,listen: false);

    //final time = DateTime.now();
    //
    //AndroidAlarmManager.oneShotAt
    //(
    //  provider.parseAlarm(time.year, time.month, time.day),
    //  0, AlarmProvider.showAlarmNotification,
    //  alarmClock: true,exact: true,wakeup: true,
    //)
    //.then((value) => Navigator.pop(context));

    print("${provider.hour}:${provider.minute}");
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          SizedBox(height: 20.h),
          const AlarmTimePicker(),
          Container
          (
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: ScreenUtil().screenHeight/2,
            decoration: BoxDecoration
            (
              color: AppStyles.cardColor,
              borderRadius: BorderRadius.circular(24)
            ),
            child: Column(children:
            [
              SizedBox(height: 24.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:
              [
                Text("4 GÜN",style: AppStyles.subTxtStyle),
                IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_outlined,color: AppStyles.softWhite))
              ]),
              _dayPicker(),
              TextField(),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            _txtButton(() => Navigator.pop(context), "İptal et"),
            _txtButton(() => _setAlarm(), "Oluştur"),
          ]),
        ],
      ),
    );
  }
}